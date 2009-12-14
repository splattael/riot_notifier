# Doesn't notify at all. Is used as auto-detection fallback.
module RiotNotifier

  class None < Base
    def notify(color, msg)
      # noop
    end

    def self.usable?
      true
    end
  end

end
