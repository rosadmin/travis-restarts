def restart_travis(repo, sleep_sec = 3)
  tries ||= 3

  p repo
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
rescue Exception => e
  p "retry " + tries.to_s
  if (tries -= 1) > 0
    sleep(sleep_sec)
    retry
  else
    raise e
  end
end
