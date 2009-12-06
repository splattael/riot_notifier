module RiotNotifier
  class Base < ::Riot::DotMatrixReporter
    def notify(color, msg)
      # overwrite me
    end

    def fail(desc, message)
      super
      say yellow("#{desc}: #{message}")
      notify(:red, "FAILURE: #{message}")
    end

    def error(desc, error)
      super
      say red("#{desc}: #{error}")
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

  class Libnotify < Base
    OPTIONS = {
      :green => {
        :icon_path => "/usr/share/icons/gnome/scalable/emblems/emblem-default.svg",
        :timeout => 2.5,
        :urgency => :normal,
        :summary => ":-)"
      },
      :red => {
        :icon_path => "/usr/share/icons/gnome/scalable/emotes/face-angry.svg",
        :timeout => 2.5,
        :urgency => :critical,
        :summary => ":-("
      }
    }

    def initialize
      require 'libnotify'
      super()
    end

    def notify(color, msg)
      options = OPTIONS[color] or raise "unknown color #{color}"

      ::Libnotify.show(options.merge(:body => msg))
    end
  end

  class RedgreenNotifier < Base
    attr_reader :path
    PATH = ENV['HOME'] + "/bin/notify_redgreen"
    
    def initialize(path = PATH)
      super()
      @path = path
    end

    def notify(color, msg)
      msg.gsub!(/</, '&lt;')
      msg.gsub!(/"/, "\\\"")
      exec "#{@path} #{color} \"#{msg}\""
    end

    def exec(*args)
      Kernel.system(*args)
    end
  end
end
