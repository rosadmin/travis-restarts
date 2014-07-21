require 'travis'

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

desc "Builds the ENV['TRAVIS_REPOSITORY'] travis job with token ENV['TRAVIS_TOKEN']"
task :build do
  Travis.access_token = ENV['TRAVIS_TOKEN']

  repos = ['TRAVIS_REPO_ALM','TRAVIS_REPO_ANTWEB','TRAVIS_REPO_ECOENGINE',
    'TRAVIS_REPO_ELASTIC','TRAVIS_REPO_ELIFE','TRAVIS_REPO_GIT2R','TRAVIS_REPO_PALEOBIODB',
    'TRAVIS_REPO_RALTMETRIC','TRAVIS_REPO_RBHL','TRAVIS_REPO_RBISON','TRAVIS_REPO_REBIRD',
    'TRAVIS_REPO_RENTREZ','TRAVIS_REPO_RFIGSHARE','TRAVIS_REPO_RFISHBASE',
    'TRAVIS_REPO_RFISHERIES','TRAVIS_REPO_RGAUGES','TRAVIS_REPO_RGBIF','TRAVIS_REPO_RINAT',
    'TRAVIS_REPO_RNEXML','TRAVIS_REPO_RNOAA','TRAVIS_REPO_RPLOS','TRAVIS_REPO_RSNPS',
    'TRAVIS_REPO_RWBCLIMATE','TRAVIS_REPO_SOLR','TRAVIS_REPO_SPOCC','TRAVIS_REPO_TAXIZE',
    'TRAVIS_REPO_TESTDAT','TRAVIS_REPO_TREEBASE','TRAVIS_REPO_BOLD']

  repos.each do |iter|
    restart_travis(iter)
  end

end
  # Travis::Repository.find(ENV['TRAVIS_REPO_ALM']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_ANTWEB']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_ECOENGINE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_ELASTIC']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_ELIFE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_GIT2R']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_PALEOBIODB']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RALTMETRIC']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RBHL']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RBISON']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_REBIRD']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RENTREZ']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RFIGSHARE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RFISHBASE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RFISHERIES']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RGAUGES']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RGBIF']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RINAT']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RNEXML']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RNOAA']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RPLOS']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RSNPS']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_RWBCLIMATE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_SOLR']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_SPOCC']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_TAXIZE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_TESTDAT']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_TREEBASE']).last_build.restart
  # Travis::Repository.find(ENV['TRAVIS_REPO_BOLD']).last_build.restart
# end
