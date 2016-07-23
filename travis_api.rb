require 'faraday'
require 'faraday_middleware'
require 'multi_json'

tbase = 'https://api.travis-ci.org'

$conn = Faraday.new(:url => tbase) do |f|
	f.adapter  Faraday.default_adapter
end
$conn.headers[:accept] = 'application/vnd.travis-ci.2+json'
$conn.headers['Authorization'] = 'token ' + ENV['TRAVIS_TOKEN']

$conn2 = Faraday.new(:url => tbase) do |f|
	f.adapter  Faraday.default_adapter
end
$conn2.headers['Travis-API-Version'] = '3'
$conn2.headers['Authorization'] = 'token ' + ENV['TRAVIS_TOKEN']

def get_repo(x)
	res = $conn.get 'repos/' + ENV[x]
	xx = MultiJson.load(res.body)
	if xx.keys[0] == 'file'
		xx = nil
	end
	return xx
end

def restart_me(x)
	res2 = $conn2.post 'build/%s/restart' % x['repo']['last_build_id']
	return MultiJson.load(res2.body)
end

# def do_travis(x)
# 	begin
# 		res = $conn.get 'repos/' + x
# 		json = MultiJson.load(res.body)
# 	rescue Exception => e
# 		e
# 	end

# 	begin
# 		res2 = $conn2.post 'build/%s/restart' % json['repo']['last_build_id']
# 		MultiJson.load(res2.body)
# 	rescue Exception => e
# 		e
# 	end
# end

# get_repo(x = 'ropenscilabs/spplist')
# do_travis(x = 'ropenscilabs/spplist')
