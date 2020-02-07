require'pry'
require_relative './api'
require_relative './beers'

module Brewery
 class User
    
  def call
    beers
    welcome
  end

  def welcome
    puts 'Hello, and welcome to an alcoholics dream, enter a beer name or type "list"'
    input = gets.chomp
      
   if input == "list"
    beer_list
    get_beer_by_number
    get_more_info
    make_another_selection  
   elsif get_beer_by_name(input)
    get_more_info
    make_another_selection
   else
    exit(input) 
   end
  end
   
  def beers
    Brewery::API.get_beers.each.uniq{|beer| Brewery::Beer.new(beer)}
  end

  def beer_list
    organised_list = Brewery::Beer.all.sort {|a,b| a.name <=> b.name}
    organised_list.each.with_index(1) do |beer, index|
    puts "#{index}. #{beer.name}"
    end
  end

  def get_beer_by_number
    puts "----Enter a number between 1-25----"
    input = gets.chomp
         
   if input.to_i > 0 && input.to_i <= Brewery::Beer.all.length
    beer_list = Brewery::Beer.all.sort {|a,b| a.name <=> b.name}
    @current_beer = beer_list[input.to_i-1]
     puts "You picked #{@current_beer.name}, find out about it's food pairings, description or abv value "
   end 
  end
 
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def invalid_input
    puts "Are you sure you like beer? Try typing beer or list" 
  end

  def get_beer_by_name(input)
    specific_beer = Brewery::Beer.get_beer_by_name(input)
   if specific_beer != nil
    @current_beer = specific_beer
    puts "You picked #{@current_beer.name}, find out about it's food pairings, description or abv value "
    specific_beer
   end  
  end

  def get_more_info
    input = gets.chomp.downcase
   if input == "food pairings"
    puts "Have you tasted it with these types of foods: #{@current_beer.food_pairing.join(", ")}"
   elsif input == "abv"
    puts "The abv value is...#{@current_beer.abv}, not too strong!"
   elsif input == "description"
    puts "#{@current_beer.description}"
   end
  end

  def make_another_selection
    sleep(0.5)
    puts "Still thristy? Maybe have another.. type another beer name or hit the list"
    welcome
  end

  def exit(input)   
    input == "exit" 
    abort "Now go get yourself a beer!"
  end

 end
end
 