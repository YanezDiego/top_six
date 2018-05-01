class TopSix::Scraper

    def self.scrape_top_album_page
      doc = Nokogiri::HTML(open("https://pitchfork.com/best"))
      albums = []

      doc.css("section#best-new-albums").each do |album|
        album_title = album.css("h2.title").text
        album_artist = album.css("ul.artist-list").text
        album_genre = album.css('a.genre-list__link').text
        binding.pry
        albums << {title: album_title, artist: album_artist, genre: album_genre}
      end
      albums
    end
    #doc.css("section#best-new-albums").css("ul.artist-list").text #<=artist list
    #doc.css("section#best-new-albums").css("h2.title").text #<= album title
    #doc.css("section#best-new-albums").css('a.genre-list__link').text #<- album genre



end


TopSix::Scraper.scrape_top_album_page
