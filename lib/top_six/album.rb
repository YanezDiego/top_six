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

    def self.reset
      @@albums.clear
    end

    def self.find_by_title(title)
      # how could we build out this method to help us find an Album?
      # Or, suppose we wanted to allow different albums to have the same title,
      # in that case, we would have to check artist and title...
      # how we make that happen?
    end

    def review
      #returns the review snippet & rating of the corresponding album from second page
      TopSix::Review.all.each do |i|
        @@albums << i
      end
    end

end
