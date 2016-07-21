require 'faraday'
require 'faraday_middleware'
require 'multi_json'

def do_travis(x)
	tbase = 'https://api.travis-ci.org'

	$conn = Faraday.new(:url => tbase) do |f|
		f.adapter  Faraday.default_adapter
	end

	$conn.headers[:user_agent] = 'faraday/' + Faraday::VERSION + '; travis-restarts'
	$conn.headers[:accept] = 'application/vnd.travis-ci.2+json'
	$conn.headers['Authorization: token'] = ENV['TRAVIS_TOKEN']

	begin
		res = $conn.get 'repos/' + x
		json = MultiJson.load(res.body)
	rescue Exception => e
		e
	end

	begin
		res2 = $conn.post 'builds/%s/restart' % json['repo']['last_build_id']
		MultiJson.load(res2.body)
	rescue Exception => e
		e
	end
end

do_travis('ropenscilabs/spplist')

$conn.headers[:accept] = 'application/json; version=2'
