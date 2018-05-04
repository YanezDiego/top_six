class TopSix::Scraper

    def initialize

    end


    def self.scrape_top_album_page
      doc = Nokogiri::HTML(open("https://pitchfork.com/best"))

      TopSix::Album.reset
      doc.css('section#best-new-albums div.bnm-small.album-small').each do |album|
        a = TopSix::Album.new
        a.link = album.css("a.link-block").attribute("href").value
        a.title = album.css("h2.title").text
        a.artist = album.css('ul.artist-list li').text
        a.genre = album.css('a.genre-list__link').text
        a.save
      end
      TopSix::Album.all
    end

    def self.get_review(input)
      doc = Nokogiri::HTML(open("http://www.pitchfork.com#{TopSix::Album.all[input].link}")) #scrapes the review HTML

      TopSix::Review.reset
      doc.css("div.review-detail"). each do |review|
        r = TopSix::Review.new
        r.rating = review.css("div.score-circle span.score").text
        r.review = review.css("div.review-detail__abstract p").text
        r.save
      end
      TopSix::Review.all
    end


end



#.to_i - 1
#TopSix::Scraper.get_review
#TopSix::Scraper.scrape_top_album_page

#doc.css("div.review-detail").css("div.score-circle span.score").text #<-score
#doc.css("div.review-detail").css("div.review-detail__abstract p").text #<- review

#doc = Nokogiri::HTML(open("http://www.pitchfork.com#{TopSix::Album.all[input - 1].link}"))
