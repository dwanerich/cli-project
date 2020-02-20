class Story

    @@all = []

    attr_accessor :title, :byline, :abstract

    def initialize(title, byline, abstract)
        @title = title
        @byline = byline
        @abstract = abstract
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.clear_all
        @@all.clear
    end


    
end