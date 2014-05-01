require 'travis'

desc "Builds the ENV['TRAVIS_REPOSITORY'] travis job with token ENV['TRAVIS_TOKEN']"
task :build do
  Travis.access_token = ENV['TRAVIS_TOKEN']
  
  Travis::Repository.find(ENV['TRAVIS_REPO_ALM']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_ANTWEB']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_BMC']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_ECOENGINE']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_ELASTIC']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_ELIFE']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_GIT2R']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_PALEOBIODB']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RALTMETRIC']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RBHL']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RBISON']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_REBIRD']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RENTREZ']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RFIGSHARE']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RFISHBASE']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RFISHERIES']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RGAUGES']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RGBIF']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RINAT']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RNEXML']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RNOAA']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RPLOS']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RSNPS']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_RWBCLIMATE']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_SOLR']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_SPOCC']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_TAXIZE']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_TESTDAT']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPO_TREEBASE']).last_build.restart
end
