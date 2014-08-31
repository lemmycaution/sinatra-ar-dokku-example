require 'active_record'
require 'sinatra'

use ActiveRecord::ConnectionAdapters::ConnectionManagement 

if ENV['RACK_ENV'] == "production"
  db = URI.parse(ENV['DATABASE_URL'])        
  ActiveRecord::Base.establish_connection(
  adapter:      'postgresql',
  host:         db.host,
  username:     db.user,
  port:         db.port,
  password:     db.password,
  database:     db.path[1..-1],
  encoding:     'utf8',
  pool:         ENV['DB_POOL'] || 5,
  connections:  ENV['DB_CONNECTIONS'] || 20,
  reaping_frequency: ENV['DB_REAP_FREQ'] || 10
  )
else # local environment
  ActiveRecord::Base.establish_connection( YAML.load(ERB.new(File.read("config/database.yml")).result)[ENV['RACK_ENV']] )
end

class Req < ActiveRecord::Base
end

get "/" do
  req = Req.create!(meta: request.params.inspect)
  "id: #{req.id}, meta: #{req.meta}"
end