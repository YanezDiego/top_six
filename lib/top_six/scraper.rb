class TopSix::Scraper

    def initialize

    end


    def self.scrape_top_album_page
      doc = Nokogiri::HTML(open("https://pitchfork.com/best"))

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
      doc = Nokogiri::HTML(open("http://www.pitchfork.com#{TopSix::Album.all[input - 1].link}")) #scrapes the review HTML
    end

    def self.scrape_review
      doc
    end

end

#TopSix::Scraper.scrape_review
#TopSix::Scraper.scrape_top_album_page

#doc = Nokogiri::HTML(open("http://www.pitchfork.com#{TopSix::Album.all[input - 1].link}"))
