#!/usr/bin/ruby

require 'mongo'
require 'uri'
require 'json'

#def get_connection
#  return @db_connection if @db_connection
#  db = URI.parse(ENV['192.168.2.3'])
#  db_name = db.path.gsub(/^\//, '')
#  @db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
#  @db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.password.nil?)
#  @db_connection
#end
#db = get_connection

Mongo::Client.new([ '192.168.2.3:27017' ], :database => 'test')
Mongo::Client.new([ '192.168.2.3:27017' ], :database => 'test', :connect => :direct)
Mongo::Client.new('mongodb://192.168.2.3:27017/mydb')

if ARGV.empty?
  puts "\n\nPlease insert your name:\n\n"
  name = gets
  puts "\n\nHello #{name}\n\n"
else
  raise "Please don't pass any argument"
end
