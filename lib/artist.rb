class Artist 
    #rspec spec/01_artist_spec.rb
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name  = name
        save 
    end 

    def save
        self.class.all << self 
    end 
    
    def find_songs
        Song.all.select do |song|
            song.artist == self
        end 
    end 

    def songs
        find_songs
    end 

    def genres
        genres = []
        find_songs.each do |song|
            genres << song.genre
        end 
        genres
    end 
    
    def new_song(name, genre)
        Song.new(name, self, genre)
    end 

  
    
    def self.all
        @@all 
    end 
end 
