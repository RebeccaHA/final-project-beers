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
        get_more_info
      elsif input == Beer.name
        beers
        get_beer_by_name
        get_more_info
      elsif input == "exit"
        exit
      else invalid_input
      end
    end
   
    def beers
        API.get_beers.each {|beer| Beer.new(beer)}
    end

    def beer_list
     organised_list = Beer.all.sort {|a,b| a.name <=> b.name}
     organised_list.each.with_index(1) do |beer, index|
      puts "#{index}. #{beer.name} "
        end
    end

    def get_beer_by_number
        puts "----Enter a number between 1-25----"
        input = gets.chomp.to_i
         if input > 0 && input <= Beer.all.length
          beer_list = Beer.all.sort {|a,b| a.name <=> b.name}
          beer = beer_list[input-1]
          puts "You picked #{beer.name}, find out about it's food pairings, description or abv value "
          get_more_info
         else 
          invalid_input
        end
        
    end

    def valid_input(input, data)
     input.to_i <= data.length && input.to_i > 0
    end

    def invalid_input
      puts "Are you sure you like beer? Try typing a name or list"
      welcome
    end


    def get_beer_by_name
     input = gets.chomp.downcase
     Beer.all.each do |beer|
        if beer.name.downcase.include?(input)
            puts "You picked #{beer.name}, find out about it's food pairings, description or abv value "
            get_more_info
        end
     end
    end

    def get_more_info
        input = gets.chomp.downcase
        if input == "food pairing"
            puts"#{Beer.food_pairing}"
        elsif input == "abv"
            puts "#{Beer.abv}"
        elsif input == "decscription"
            puts "#{Beer.description}"
        end
    end

    def exit
     puts "Now go get yourself a beer"
    end
end

 