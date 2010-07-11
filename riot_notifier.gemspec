# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{riot_notifier}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Suschlik"]
  s.date = %q{2010-07-11}
  s.email = %q{peter-riot_notifier@suschlik.de}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     ".rvmrc",
     ".watchr",
     "Gemfile",
     "Gemfile.lock",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/riot_notifier.rb",
     "lib/riot_notifier/base.rb",
     "lib/riot_notifier/ext.rb",
     "lib/riot_notifier/libnotify.rb",
     "lib/riot_notifier/module.rb",
     "lib/riot_notifier/none.rb",
     "lib/riot_notifier/redgreen_binary.rb",
     "riot_notifier.gemspec",
     "test/helper.rb",
     "test/test_riot_notifier.rb"
  ]
  s.homepage = %q{http://github.com/splattael/riot_notifier}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple notifier for riot}
  s.test_files = [
    "test/test_riot_notifier.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<riot>, [">= 0.10.12"])
      s.add_development_dependency(%q<riot_notifier>, [">= 0"])
      s.add_development_dependency(%q<libnotify>, [">= 0"])
    else
      s.add_dependency(%q<riot>, [">= 0.10.12"])
      s.add_dependency(%q<riot_notifier>, [">= 0"])
      s.add_dependency(%q<libnotify>, [">= 0"])
    end
  else
    s.add_dependency(%q<riot>, [">= 0.10.12"])
    s.add_dependency(%q<riot_notifier>, [">= 0"])
    s.add_dependency(%q<libnotify>, [">= 0"])
  end
end

