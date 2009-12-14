require 'riot'

require 'riot_notifier/module'
require 'riot_notifier/base'

# Reverse load order!

# Fallback
require 'riot_notifier/none'

# Custom notifiers - loading is important for auto-detection
# LIFO!
require 'riot_notifier/redgreen_binary'
require 'riot_notifier/libnotify'
