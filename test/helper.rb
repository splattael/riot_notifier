require 'rubygems'
require 'riot'

require 'riot_notifier'

Riot.reporter = RiotNotifier

module Riot
  class Situation
    # Create backtrace for this exception.
    def bt!(error)
      return error if error.backtrace
      raise error
    rescue error.class => e
      e
    end
  end
end
