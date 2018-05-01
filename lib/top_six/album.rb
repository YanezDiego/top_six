class TopSix::Album
  attr_accessor :title, :artist, :genre, :rating, :review

    def self.best_new
      # gather scraped album information from Pitchfork list and returns the data needed.
      #Artist, Tittle, and Genre

    end

    def self.review
      #returns the review snippet & rating of the corresponding album from second scrape
    end



end
