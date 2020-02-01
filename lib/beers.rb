class Generator::Beer
attr_accessor :name, :description, :abv, :fooding_pairing
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




   
  

end
