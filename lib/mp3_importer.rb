class MP3Importer
    attr_reader :path
    def initialize(path)
        @path = path
    end

    def files
        filenames = Dir[@path + "/*"]
        filenames.map do |filename|
            filename[@path.length+1..filename.length]
        end
    end

    def import 
        filenames = self.files
        filenames.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end
