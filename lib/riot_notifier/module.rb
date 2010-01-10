# Notifies you about failures and errors in your riot tests!
#
# Usage:
#   require 'riot'
#   require 'riot_notifier'
#
#   # auto-detection
#   Riot.reporter = RiotNotifier
#   # try these first
#   Riot.reporter = RiotNotifier[:RedgreenBinary, :Libnotify]
#
module RiotNotifier

  def self.new(*args, &block)
    notifier_class = notifier_classes.detect(&:usable?) || None
    notifier_class.new(*args, &block)
  end

  def self.register(notifier)
    order.unshift notifier
  end

  def self.unregister(notifier)
    order.delete notifier
  end

  def self.unregister_all
    order.clear
  end

  def self.order
    @order ||= []
  end

  def self.try(*order)
    @order = order
    self
  end

  class << self
    alias [] try
  end

  def self.notifier_classes
    order.map { |o| resolve_notifier_class(o) }.compact - [None]
  end

  def self.resolve_notifier_class(o)
    case o
    when Class; o
    when Symbol, String; const_get(o)
    else
      nil
    end
  end

end
