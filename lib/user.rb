require'pry'
require_relative './api'
require_relative './beers'

class User

    

    def call
        puts 'Hello, and welcome to an alcoholics dream, enter a beer or type "list"'
        welcome
    end

  

    def welcome
     input = gets.chomp.downcase
      if input == "list"
        beers
        beer_list
        get_beer_by_number
      elsif get_beer_by_name(input)
        get_beer_by_name(input)
      else invalid_input
       end
    end
   
    def beers
       @beers = API.get_beers.each {|beer| Beer.new(beer)}
       @beers
    end

    def beer_list
     organised_list = Beer.all.sort {|a,b| a.name <=> b.name}
     organised_list.each.with_index(1) do |beer, index|
      puts "#{index}. #{beer.name} "
        end
    end

    def valid_input(input, data)
     input.to_i <= data.length && input.to_i > 0
    end

    def invalid_input
        puts "Are you sure you like beer? Try typing a name or list, or get out of here!"
    end

    def get_beer_by_number
    
    end


    def get_beer_by_name(chosen_beer)
        input = gets.chomp.downcase
        Beer.all.detect {|beer| beer.name == name}
   
    end

    def exit
     puts "Now go get yourself a beer"
    end
end

 