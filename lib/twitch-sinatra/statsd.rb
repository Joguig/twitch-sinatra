require 'statsd-ruby'

module TwitchSinatra
	module Statsd
		module Helpers
			def stats
				settings.stats
			end
		end

		def stats
			@stats ||= ::Statsd::Batch.new(::Statsd.new(stats_host, stats_port).tap{|sd| sd.namespace = "#{service_name}.#{environment}"})
		end

		def self.registered(app)
			app.helpers Statsd::Helpers

			host = 'localhost'
			port = '8125'

			if ENV['STATSD_HOST_PORT'] != nil and ENV['STATSD_HOST_PORT'].length > 0
				host, port = ENV['STATSD_HOST_PORT'].split(':')
			end

			app.set :stats_host, host
			app.set :stats_port, port
		end
	end
end