class TopSix::Scraper

    def self.scrape_top_album_page
      doc = Nokogiri::HTML(open("https://pitchfork.com/best"))

      albums = []

      doc.css('section#best-new-albums div.bnm-small.album-small').each do |album|
        album_review_link = album.css("a.link-block").attribute("href").value
        album_title = album.css("h2.title").text
        album_artist = album.css('ul.artist-list li').text
        album_genre = album.css('a.genre-list__link').text
        albums << {title: album_title, artist: album_artist, genre: album_genre, url:album_review_link}
      end
      binding.pry
      albums
    end

    def self.scrape_review
     #when doc = Nokogiri::HTML(open()) scrapes the review HTML
    end

end


#TopSix::Scraper.scrape_top_album_page


#doc.css('div.bnm-small.album-small').css('ul.artist-list li')
#.css('h2.title')
#.css('a.genre-list__link')


#doc.css("section#best-new-albums").each do |album|
#  album_title = album.css("h2.title").collect{|title| title.text}
#  album_artist = album.css("ul.artist-list").collect{|artist| artist.text}
#  album_genre = album.css('a.genre-list__link').collect{|genre| genre.text}
#  albums << {title: album_title, artist: album_artist, genre: album_genre}
