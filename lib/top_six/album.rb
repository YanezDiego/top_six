class TopSix::Album
  attr_accessor :album, :title, :artist, :genre, :rating, :review, :link

  @@albums = []

    def initialize

    end

    def self.all
      @@albums
    end

    def save
      @@albums << self
    end

    def review
      #returns the review snippet & rating of the corresponding album from second page
      TopSix::Review.all.each do |i|
        @@albums << i
      end
    end



end
