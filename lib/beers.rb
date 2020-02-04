require_relative "./user"
require_relative "./api"
require 'pry'
module Brewery 
class Beer
attr_accessor :name, :description, :abv, :food_pairing
@@all = []

    def initialize(attributes)
        attributes.each do |k,v|
            begin
                self.send("#{k}=",v)
            rescue
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
end
end
