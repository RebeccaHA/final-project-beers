require'pry'

class User

    def intialize
        API.get_beers.each {|beer| Beer.new(beer)}
    end

  

    def welcome
     puts 'Hello, and welcome to an alcholics dream, enter a beer or type "list"'
      
     input = gets.chomp

      case input 
       when input == "list"
        beer_list
       end
    end
   
    def beer_list
        organised_list = Beer.all.sort {|a,b| a.name <=> b.name}
         organised_list.each.with_index(1) do |beer, index|
          puts "#{index}. #{beer.name} "
        end
    end

    def get_beer_by_name(input)
        Beer.all.detect {|beer| beer.name == name}
    end

    def exit
    end
end

  User.new.beer_list