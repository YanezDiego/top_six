class TopSix::Album
  attr_accessor :title, :artist, :genre, :rating, :review

    def self.best_new
      # gather scraped album information from Pitchfork list and returns the data needed.
      #Artist, Tittle, and Genre #puts"#{albums(:title[0])} - #{albums(:artist[0])} - #{albums(:genre[0])}"

    end

    def self.review
      #returns the review snippet & rating of the corresponding album from second page
    end



end
