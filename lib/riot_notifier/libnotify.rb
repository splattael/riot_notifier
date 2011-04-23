# Notifies via libnotify.
module RiotNotifier

  class Libnotify < Base
    ICON = {
      :green => %w[
        /usr/share/icons/gnome/scalable/emblems/emblem-default.svg
        /usr/share/icons/gnome/256x256/emotes/face-laugh.png
      ],
      :red => %w[
        /usr/share/icons/gnome/scalable/emotes/face-angry.svg
        /usr/share/icons/gnome/256x256/emotes/face-angry.png
      ]
    }

    OPTIONS = {
      :green => {
        :icon_path => ICON[:green].find { |path| File.exist?(path) },
        :timeout => 2.5,
        :urgency => :normal,
        :summary => ":-)"
      },
      :red => {
        :icon_path => ICON[:red].find { |path| File.exist?(path) },
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
