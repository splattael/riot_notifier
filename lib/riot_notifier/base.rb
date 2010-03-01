# Base class for all specific notifiers.
#
# Each notifier should implement +notify+ and +usable?+.
#
# Note: Base is NOT usable.
module RiotNotifier

  class Base < ::Riot::DotMatrixReporter

    def initialize(*args, &block)
      raise "#{self.class} is NOT usable" unless self.class.usable?
      super
    end

    # Notifies you about failures and errors.
    # This methods should be overridden in order to define specific notifications libraries.
    def notify(color, msg)
      # override me
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

    def fail(desc, message, file, line)
      super
      notify(:red, "FAILURE: #{message}@#{file}:#{line}")
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

  end

end
