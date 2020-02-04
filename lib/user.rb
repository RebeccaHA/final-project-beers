require'pry'
require_relative './api'
require_relative './beers'

class User
    
  
    
  

    def call
        puts 'Hello, and welcome to an alcoholics dream, enter a beer name or type "list"'
        beers
        welcome
    end

    def welcome
     input = gets.chomp
      
      if input == "list"
        beer_list
        get_beer_by_number
        get_more_info
        make_another_selection
      elsif get_beer_by_name(input)
        get_more_info
        make_another_selection
      elsif input == "exit"
        exit
      else invalid_input
      end
    end
   
    def beers
        API.get_beers.each.uniq{|beer| Beer.new(beer)}
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
          @current_beer = beer_list[input-1]
          puts "You picked #{@current_beer.name}, find out about it's food pairings, description or abv value "
        end 
    end
 
    def valid_input(input, data)
     input.to_i <= data.length && input.to_i > 0
    end

    def invalid_input
      puts "Are you sure you like beer? Try typing beer or list"
      welcome
    end


    def get_beer_by_name(input)
     
      Beer.all.detect do |beer|
      if beer.name == input
        @current_beer = beer
        puts "You picked #{@current_beer.name}, find out about it's food pairings, description or abv value "
        beer
      end
     end
    end

    def get_more_info
        input = gets.chomp.downcase
        if input == "food pairings"
            puts "Have you tasted it with these types of foods#{@current_beer.food_pairing.join(" , ")}"
        elsif input == "abv"
            puts "The abv value is...#{@current_beer.abv}, not too strong, maybe have another?"
        elsif input == "description"
            puts "#{@current_beer.description}"
        end
    end

    def make_another_selection
      puts "Still thristy? Type another beer name or hit the list"
      welcome
    end

    def exit
     puts "Now go get yourself a beer"
    end

end

 