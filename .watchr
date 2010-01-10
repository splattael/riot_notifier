#!/usr/bin/env watchr

def run(*args)
  clear
  system "ruby -rubygems -Ilib:test #{args.join(' ')}"
end

def run_tests
  clear
  system "rake test"
end

def clear
  system "clear"
end

def underscore(file)
  file.gsub('/', '_')
end

watch('test/test_.*\.rb')  {|md| run md[0] }
watch('lib/(.*)\.rb')      { run_tests }
watch('test/helper.rb')    { run_tests }

run_tests

Signal.trap("QUIT") { abort("\n") }
Signal.trap("INT") { run_tests }
