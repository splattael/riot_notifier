# Base class for all specific notifiers.
#
# Each notifier should implement +notify+ and +usable?+.
#
# Note: Base is NOT usable.
module RiotNotifier

  class Base
    @@reporter_class = Riot::DotMatrixReporter

    def initialize(*args, &block)
      raise "#{self.class} is NOT usable" unless self.class.usable?
      @reporter = @@reporter_class.new(*args, &block)
    end

    # Notifies you about failures and errors.
    # This methods should be overridden in order to define specific notifications libraries.
    def notify(color, msg)
      # override me
    end

    REPORTER_CLASSES = {
      :dots     => Riot::DotMatrixReporter,
      :verbose  => Riot::VerboseStoryReporter,
      :story    => Riot::StoryReporter
    }.each do |type, reporter_class|
      instance_eval <<-RUBY
        def self.#{type}
          @@reporter_class = #{reporter_class}
          self
        end
      RUBY
    end

    # Tests if this notifier is usable.
    # Should contain some initialization code e.g. require 'libnotify'.
    def self.usable?
      # override
      false
    end

    def self.inherited(notifier)
      ::RiotNotifier.register notifier
    end

    # Override

    def fail(desc, message)
      super
      notify(:red, "FAILURE: #{message}")
    end

    def error(desc, error)
      super
      notify(:red, "ERROR: #{error}")
    end

    def results(time_taken)
      super
      unless bad_results?
        notify(:green, "%d passes, %d failures, %d errors in %s seconds" % [passes, failures, errors, ("%0.6f" % time_taken)])
      end
    end

  private

    def bad_results?
      failures + errors > 0
    end

    def method_missing(*args, &block)
      @reporter.send(*args, &block)
    end

  end

end
