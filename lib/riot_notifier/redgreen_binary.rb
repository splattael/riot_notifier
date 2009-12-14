# Notifies via $HOME/bin/notify_redgreen (with notify-send)
module RiotNotifier

  class RedgreenBinary < Base
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

    def self.usable?
      File.exist?(PATH)
    end
  end

end
