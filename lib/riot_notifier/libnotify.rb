# Notifies via libnotify.
module RiotNotifier

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
