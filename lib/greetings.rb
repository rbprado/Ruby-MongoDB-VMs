#!/usr/bin/ruby

require 'mongo'
require 'json'

MONGODB_HOST = '192.168.2.3'
MONGODB_PORT = '27017'

# @author Rafael Benhur do Prado
class Greetings

    # Initializes Greetings class, call methods.
    # Also executes the application till the end.
    # The return is printed to the terminal.
    def initialize()
        name = gets_username()

        raise "Invalid name, please insert at least one char." if name.empty?

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
    end

    # Receive the username from the keyboard input.
    #
    # @return [String] The string emtered by user.
    def gets_username()
        puts "#" * 27
        puts "# Please insert your name #"
        puts "#" * 27
    
        gets.chomp
    end

    # Connect to the mongodb database.
    #
    # @return [Object] Object with connection to the database.
    def mongodb_connect()
        client = Mongo::Client.new([ MONGODB_HOST+':'+MONGODB_PORT ], :database => 'test')
        client[:users]
    end

    # Query for the user at the database.
    # Iterates over the collection :users.
    # Convert the hash to string.
    #
    # @param [String] name from the user.
    # @return [String] name from the db.
    def mongodb_user_find(name)
        users = mongodb_connect()
        users_hash = Hash.new
        users.find(:name => name).each do |username|
            users_hash = username
        end

        users_hash["name"].to_s  
    end

    # Insert name to the mongodb database.
    #
    # @param [String] name from the user.
    # @return [Boolean] Insertion result.
    def mongodb_user_insert(name)
        users = mongodb_connect()
        users.insert_one({ name: name })
    end

end
