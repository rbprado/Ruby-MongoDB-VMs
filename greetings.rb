#!/usr/bin/ruby

require 'mongo'
require 'json'

MONGODB_HOST = '192.168.2.3'
MONGODB_PORT = '27017'

def gets_username()
    puts "#" * 27
    puts "# Please insert your name #"
    puts "#" * 27
    
    gets.chomp
end

def mongodb_connect()
    client = Mongo::Client.new([ MONGODB_HOST+':'+MONGODB_PORT ], :database => 'test')
    client[:users]
end

def mongodb_user_find(name)
    users = mongodb_connect()
    users_hash = Hash.new
    users.find(:name => name).each do |username|
        users_hash = username
    end

    users_hash["name"].to_s  
end

def mongodb_user_insert(name)
    users = mongodb_connect()
    users.insert_one({ name: name })
end

name = gets_username()
if mongodb_user_find(name) != name
    puts "#" * (10 + name.length.to_i)
    puts "# Hello #{name} #"
    puts "#" * (10 + name.length.to_i)
    mongodb_user_insert(name)
else
    puts "#" * (17 + name.length.to_i) 
    puts "# Welcome back #{name} #"
    puts "#" * (17 + name.length.to_i)
end
