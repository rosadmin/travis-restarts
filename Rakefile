require 'travis'

desc "Builds the ENV['TRAVIS_REPOSITORY'] travis job with token ENV['TRAVIS_TOKEN']"
task :build do
  Travis.access_token = ENV['TRAVIS_TOKEN']
  Travis::Repository.find(ENV['TRAVIS_REPOSITORY']).last_build.restart
  Travis::Repository.find(ENV['TRAVIS_REPOSITORY_RBISON']).last_build.restart
end
