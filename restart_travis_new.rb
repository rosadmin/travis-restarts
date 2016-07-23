require_relative 'travis_api'

def restart_travis_(repo, sleep_sec = 3)
  tries ||= 3
  p repo
  lb = get_repo(repo)
  if !lb.nil?
    restart_me(lb)
  else
    p 'skipping, not found'
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
