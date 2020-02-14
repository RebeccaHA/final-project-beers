class Generator::API
    BASE = 'https://api.punkapi.com/v2/'

    def self.get_beers
     beers = HTTParty.get(BASE + "beers?page=1&per_page=80")
    end

end


