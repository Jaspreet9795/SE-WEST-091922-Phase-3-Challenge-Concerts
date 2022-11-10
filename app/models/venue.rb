class Venue < ActiveRecord::Base
    has_many :concerts
    has_many :bands, through: :concerts

    def concert_on(date)
        self.concerts.where(date: date).first
    end 

    def most_frequent_band
        band_with_most_concerts = 0
        band_with_most = ''
        self.bands.each { |band|
            if band.concerts.length > band_with_most_concerts
                band_with_most_concerts = band.concerts.length
                band_with_most = band
            end
        }
        band_with_most
    end

end