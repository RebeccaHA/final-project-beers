require 'pry'

class API
    BASE = 'https://api.punkapi.com/v2/'

    def self.get_beers
     HTTParty.get(BASE + "/beers")
    end


end
