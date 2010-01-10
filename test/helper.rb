require 'rubygems'
require 'riot'

require 'riot_notifier'

RiotNotifier::Base.story # TODO use RiotNotifier.story
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
