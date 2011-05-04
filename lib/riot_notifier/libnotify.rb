# Notifies via libnotify.
module RiotNotifier

  class Libnotify < Base
    ICON = {
      :green  =>  "emblem-default.png",
      :red    =>  "false-angry.png"
    }

    OPTIONS = {
      :green => {
        :icon_path => ICON[:green],
        :timeout => 2.5,
        :urgency => :normal,
        :summary => ":-)"
      },
      :red => {
        :icon_path => ICON[:red],
        :timeout => 2.5,
        :urgency => :critical,
        :summary => ":-("
      }
    }

    def notify(color, msg)
      options = OPTIONS[color] or raise "unknown color #{color}"

      ::Libnotify.show(options.merge(:body => msg))
    end

    def self.usable?
      require 'libnotify'
      true
    rescue LoadError
      false
    end
  end

end
