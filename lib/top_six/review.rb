class TopSix::Review
  attr_accessor :rating, :review

@@reviews = []

    def initialize

    end

    def self.all
      @@reviews
    end

    def save
      @@reviews << self
    end

end
