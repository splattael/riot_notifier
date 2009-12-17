require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "riot_notifier"
    gem.summary = 'Simple notifier for riot'
    gem.email = "peter-riot_notifier@suschlik.de"
    gem.homepage = "http://github.com/splattael/riot_notifier"
    gem.authors = ["Peter Suschlik"]

    gem.has_rdoc = true
    gem.extra_rdoc_files = [ "README.rdoc" ]

    gem.add_dependency "riot", ">= 0.10.9"
    gem.add_development_dependency "riot_notifier"
    gem.add_development_dependency "libnotify"

    gem.test_files = Dir.glob('test/test_*.rb')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# Test
require 'rake/testtask'
desc 'Default: run unit tests.'
task :default => :test
task :test => :check_dependencies

Rake::TestTask.new(:test) do |test|
  test.test_files = FileList.new('test/test_*.rb')
  test.libs << 'test'
  test.verbose = true
end

# RDoc
require 'rake/rdoctask'
Rake::RDocTask.new do |rd|
  rd.title = "Riot Notifier"
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/*.rb")
  rd.rdoc_dir = "doc"
end


# Misc
desc "Tag files for vim"
task :ctags do
  dirs = $LOAD_PATH.select {|path| File.directory?(path) }
  system "ctags -R #{dirs.join(" ")}"
end

desc "Find whitespace at line ends"
task :eol do
  system "grep -nrE ' +$' *"
end
