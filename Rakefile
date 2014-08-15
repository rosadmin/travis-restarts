require 'travis'
require 'httparty'

def restart_travis(repo)
  lb = Travis::Repository.find(ENV[repo]).last_build
  lb_name = lb.branch_info
  if lb_name == 'master'
    lb.restart
  else
    lb.restart
    Travis::Repository.find(ENV[repo]).branches['master'].restart
  end
end

def restart_by_branch(name, slug, branch)
  body = {
    accountName: name,
    projectSlug: slug,
    branch: branch
  }
  url = 'https://ci.appveyor.com/api/builds'
  HTTParty.post(url,
      :body => body,
      :headers => {"Authorization" => 'Bearer ' + ENV['APPVEYOR_TOKEN']})
end

def restart_appveyor(repo)
  lb_url = 'https://ci.appveyor.com/api/projects/'
  out = HTTParty.get(lb_url + repo)
  lb_name = out['build']['branch']

  url = 'https://ci.appveyor.com/api/builds'
  accountName = repo.split('/')[0]
  projectSlug = repo.split('/')[1]

  if lb_name == 'master'
    restart_by_branch(accountName, projectSlug, 'master')
  else
    restart_by_branch(accountName, projectSlug, 'master')
    restart_by_branch(accountName, projectSlug, lb_name)
  end
end


desc "Builds the ENV['TRAVIS_REPOSITORY'] travis job with token ENV['TRAVIS_TOKEN']"
task :runtravis do
  Travis.access_token = ENV['TRAVIS_TOKEN']

  repos = ['TRAVIS_REPO_ALM','TRAVIS_REPO_ANTWEB','TRAVIS_REPO_ECOENGINE',
    'TRAVIS_REPO_ELASTIC','TRAVIS_REPO_ELIFE','TRAVIS_REPO_GIT2R','TRAVIS_REPO_PALEOBIODB',
    'TRAVIS_REPO_RALTMETRIC','TRAVIS_REPO_RBHL','TRAVIS_REPO_RBISON','TRAVIS_REPO_REBIRD',
    'TRAVIS_REPO_RENTREZ','TRAVIS_REPO_RFIGSHARE','TRAVIS_REPO_RFISHBASE',
    'TRAVIS_REPO_RFISHERIES','TRAVIS_REPO_RGAUGES','TRAVIS_REPO_RGBIF','TRAVIS_REPO_RINAT',
    'TRAVIS_REPO_RNEXML','TRAVIS_REPO_RNOAA','TRAVIS_REPO_RPLOS','TRAVIS_REPO_RSNPS',
    'TRAVIS_REPO_RWBCLIMATE','TRAVIS_REPO_SOLR','TRAVIS_REPO_SPOCC','TRAVIS_REPO_TAXIZE',
    'TRAVIS_REPO_TESTDAT','TRAVIS_REPO_TREEBASE','TRAVIS_REPO_BOLD','TRAVIS_REPO_RNPN',
    'TRAVIS_REPO_PLOTLY','TRAVIS_REPO_RCROSSREF','TRAVIS_REPO_REBI','TRAVIS_REPO_RGLOBI',
    'TRAVIS_REPO_RSELENIUM','TRAVIS_REPO_EML','TRAVIS_REPO_DVN','TRAVIS_REPO_RDATACITE',
    'TRAVIS_REPO_RMENDELEY']

  repos.each do |iter|
    restart_travis(iter)
  end
end

desc "Builds Appveyor job with token ENV['APPVEYOR_TOKEN']"
task :runappveyor do
  appveyor_repos = ['sckott/rgbif','sckott/alm','sckott/rnoaa','sckott/rWBclimate',
    'sckott/rinat','sckott/treeBASE','sckott/rgauges','sckott/rplos','sckott/rsnps',
    'sckott/solr','sckott/rentrez','sckott/taxize','karthik/rAltmetric','karthik/AntWeb',
    'karthik/rbison','karthik/ecoengine','karthik/rebird','karthik/rfisheries',
    'karthik/spocc']

  appveyor_repos.each do |iter|
    restart_appveyor(iter)
  end
end
