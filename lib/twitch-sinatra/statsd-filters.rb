module TwitchSinatra
  module StatsdFilters
    def start_statsd
      @statsd_timing_start = Time.now
    end

    def finish_statsd
      @name = nil unless @name

      unless @name.nil?
        metric_name = "#{@name}.#{response.status}"

        duration = (Time.now - @statsd_timing_start) * 1000
        self.stats.timing(metric_name, duration)
        self.stats.increment(metric_name)
      end
    end
  end
end