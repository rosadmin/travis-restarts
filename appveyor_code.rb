require 'httparty'
require 'YAML'

# url = 'https://ci.appveyor.com/api/builds'
# body = {
#   accountName: 'sckott',
#   projectSlug: 'rgbif',
#   branch: 'master'
# }
# token = 'keinulfr9snh43vpusg8'

# HTTParty.post(url, :body => body, :headers => {"Authorization" => 'Bearer ' + token})


def getsettings
  ymlfile = YAML.load_file('settings.yml')
  ymlfile.each do |key, value|
    ENV[key] ||= value
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
      :headers => {"Authorization" => 'Bearer ' + ENV['appveyortoken']})
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

task :build do
  getsettings()

  appveyor_repos = ['sckott/rgbif','sckott/alm','sckott/rnoaa','sckott/rWBclimate',
    'sckott/rinat','sckott/treeBASE','sckott/rgauges','sckott/rplos','sckott/rsnps',
    'sckott/solr','sckott/rentrez','sckott/taxize','karthik/rAltmetric','karthik/AntWeb',
    'karthik/rbison','karthik/ecoengine','karthik/rebird','karthik/rfisheries',
    'karthik/spocc']

  appveyor_repos.each do |iter|
    restart_appveyor(iter)
  end

end
