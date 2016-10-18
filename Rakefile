require 'travis'
require_relative 'repos'
require_relative 'restart_travis_new'
require_relative 'other_fxns'

desc "Builds the ENV['TRAVIS_REPOSITORY'] travis job with token ENV['TRAVIS_TOKEN']"
task :runtravis do
  #Travis.access_token = ENV['TRAVIS_TOKEN']
  $repos.each do |iter|
    begin
      restart_travis_(iter)
    rescue
      next
    end
    sleep(360) # sleep for 6 min between repos to respect 10 requests / hr rate limit
  end
end

desc "Builds a travis job for a Github repo of the form <owner/repo> with token ENV['TRAVIS_TOKEN']"
task :restart, [:repo] do |t, args|
  puts "Restarting build for: #{args[:repo]}"
  restart_travis_local(args[:repo])
end
