class Generator::Beer
    attr_accessor :name, :description, :abv, :food_pairing
    @@all = []


    def initialize(attributes)
        attributes.each do |k,v|
            begin
                self.send("#{k}=",v)
            rescue NoMethodError
            end
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all.clear
    end

   def self.find_beer(input)
     self.all.detect do |beer|
        beer.name == input 
     end
   end
end

