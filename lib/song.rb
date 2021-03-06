class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.new_by_filename(filename)
        filename = filename.split(" - ")
        artist = filename[0]
        name = filename[1]
        song = self.new(name)
        new_artist = Artist.new(artist)
        song.artist_name = new_artist.name
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
    end

end
