# real time stdout
$stdout.sync = true

require 'bundler/setup'
Bundler.setup

%w(lib).each do |dir|
  path = File.expand_path( "../#{dir}", __FILE__)
  $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
end

load "tasks/db.rake"