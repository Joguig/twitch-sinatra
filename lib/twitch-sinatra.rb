require 'chitin'
require 'rollbar/middleware/sinatra'
require 'sinatra/base'
require 'sinatra/namespace'
require 'twitch-sinatra/statsd'

module TwitchSinatra
	class Base < Sinatra::Base
		register Sinatra::Namespace
		register Statsd

		configure do
			use Chitin::Middleware

			Rollbar.configure do |c|
				c.disable_monkey_patch = true
				c.environment = ENV['RACK_ENV']
				c.access_token = ENV['ROLLBAR_TOKEN']
			end
			use Rollbar::Middleware::Sinatra

			set :show_exceptions, false
			set :logging, true
			set :service_name, self.name.gsub('::','.').downcase
		end

		get '/debug/running' do
			"OK"
		end
	end
end
