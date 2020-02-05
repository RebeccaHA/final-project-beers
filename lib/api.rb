require 'pry'
require_relative "./user"
require_relative "./beers"
require 'httparty'

module Brewery
class API
    BASE = 'https://api.punkapi.com/v2/'

    def self.get_beers
     beers = HTTParty.get(BASE + "/beers?page=1")
    end

    def self.get_more_beers
      more_beers = HTTParty.get(BASE + "/beers?page=2")
    end
end
end

