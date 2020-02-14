
 class Generator::User
    
  def welcome
    puts 'Hello, and welcome to an alcoholics dream, fill up your glass and lets go'
    beers
    menu
  end

  def menu
    puts 'Enter a beer name or type "list"'
    input = gets.chomp

   if input == "list"
    ten_beer_list
    get_beer_by_number
    get_more_info 
   elsif get_beer_by_name(input)
    get_more_info
   elsif input == "exit" || input == "EXIT"
    exit(input)
   else 
    invalid_input
   end
  end
   
  def beers
    Generator::API.get_beers.each.uniq{|beer| Generator::Beer.new(beer)}
  end
#old beer list before additional task
 # def beer_list
  #  @organised_list = Generator::Beer.all.sort {|a,b| a.name <=> b.name}
  #  @organised_list.each.with_index(1) do |beer, index|
  #  puts "#{index}. #{beer.name}"
  #  end
 #   puts "----Enter a number between 1-25----"
 # end

  def ten_beer_list
    organised_list = Generator::Beer.all.sort {|a,b| a.name <=> b.name}
    puts "Heres 10 ice cold beers, see more or quench your thirst and select a beer by number"
    n = 0
    organised_list.slice(n, 10).each.with_index(1) do |beer,index|
    puts "#{index}. #{beer.name}"
    end
    puts "do you want to see 10 more? type 'y' or pick one!"
    input = gets.chomp
  
     if input == 'y'
      n += 10
      organised_list.slice(n, 10).each.with_index(1) do |beer,index|
        puts "#{index}. #{beer.name}"
      end
    puts  "do you want to see 10 more? type 'y' or pick one!"  
    
    end
  end

  

  def get_beer_by_number
    input = gets.chomp
   if input.to_i > 0 && input.to_i <= Generator::Beer.all.length
    beer_list = Generator::Beer.all.sort {|a,b| a.name <=> b.name}
    @current_beer = beer_list[input.to_i-1]
     puts "You picked #{@current_beer.name}, find out more type 'abv', 'food pairings' or 'description'"
    elsif input == 'exit'
      exit(input)
   else 
    invalid_input_number 
   end 
  end

  def get_beer_by_name(input)
    specific_beer = Generator::Beer.find_beer(input)
   if specific_beer != nil
    @current_beer = specific_beer
    puts "You picked #{@current_beer.name}, find out more type 'abv', 'food pairings' or 'description'"
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
   elsif input == "more beer"
    menu
   elsif input == "exit"
    exit(input)
   else 
    invalid_input_get_more
   end
   puts 'Did that wet your whistle type "abv", "food pairings", "description" or "more beer" to find out more'
   get_more_info
  end

  def invalid_input
    puts "Invalid input!"
    menu
  end

  def invalid_input_number
    puts "Invalid input! Are you sure you like beer? Try typing a number between 1-10" 
    get_beer_by_number
  end

  def invalid_input_get_more
    puts "Invalid input! Are you sure you like beer? Try typing 'abv', 'food pairings' or 'description" 
    get_more_info
  end

  def exit(input)   
    abort "Now go get yourself a beer!"
  end



 end

 