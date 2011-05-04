
# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "riot_notifier/version"

Gem::Specification.new do |s|
  s.name        = "riot_notifier"
  s.version     = RiotNotifier::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Peter Suschlik"]
  s.email       = ["peter-riot_notifier@suschlik.de"]
  s.homepage    = "http://rubygems.org/gems/riot_notifier"
  s.summary     = %q{Simple notifier for riot}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('yard')

  s.add_runtime_dependency('riot',      "~> 0.11.0")
  s.add_runtime_dependency('libnotify', "~> 0.5.0")
end
