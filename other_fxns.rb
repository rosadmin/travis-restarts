def restart_travis_local_env(repo)
  Travis.access_token = ENV['TRAVIS_TOKEN']
  lb = Travis::Repository.find(ENV[repo]).last_build
  if !lb.nil?
    checkpr = lb.attributes['pull_request']
    lb_name = lb.branch_info
    if lb_name == 'master'
      lb.restart
    else
      if checkpr
        Travis::Repository.find(ENV[repo]).branches['master'].restart
      else
        lb.restart
        Travis::Repository.find(ENV[repo]).branches['master'].restart
      end
    end
  end
end

def restart_travis_local(repo)
  p repo
  Travis.access_token = ENV['TRAVIS_TOKEN']
  lb = Travis::Repository.find(repo).last_build
  if !lb.nil?
    checkpr = lb.attributes['pull_request']
    lb_name = lb.branch_info
    if lb_name == 'master'
      lb.restart
    else
      if checkpr
        Travis::Repository.find(repo).branches['master'].restart
      else
        lb.restart
        Travis::Repository.find(repo).branches['master'].restart
      end
    end
  end
end
