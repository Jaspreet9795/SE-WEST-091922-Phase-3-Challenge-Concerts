class Band < ActiveRecord::Base
    has_many :concerts
    has_many :venues, through: :concerts

    def play_in_venue(venue, date)
        self.concerts.create(date: date, venue: venue, band: self)
    end

    def all_introductions
        self.concerts.map(&:introduction)
    end 
    
    def self.most_performances
        band_with_most_concerts = 0
        band_with_most = ''
        Band.all.each { |band|
            if band.concerts.length > band_with_most_concerts
                band_with_most_concerts = band.concerts.length
                band_with_most = band
            end
        }
        band_with_most

    end 
end