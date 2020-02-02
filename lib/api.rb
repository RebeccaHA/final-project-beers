require 'pry'
require_relative "./user"
require_relative "./beers"

class API
    BASE = 'https://api.punkapi.com/v2/'

    def self.get_beers
     HTTParty.get(BASE + "/beers")
    end


end
