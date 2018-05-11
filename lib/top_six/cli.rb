#CLI UI

class TopSix::CLI

  def call
    system('clear')
    puts "---Welcome to top 6!---"
    menu
  end

  def menu
    puts "Tell me your choice: 'l'ist albums, 'e'xit"
      user = gets.strip.downcase
      case user
        when "l"
          top_albums
        when "e"
          goodbye
        else
          puts "please make a correct slection."
          menu
        end
    end

  def top_albums
    system('clear')
    puts "   Top Albums"
    TopSix::Scraper.scrape_top_album_page.each_with_index do |album, i|
      puts "#{i + 1}. #{album.artist} - #{album.title.gsub("â", "")} - #{album.genre}"#<- list the albums with artist and genre that are reviewed
    end
    show_review
    again?
  end

  def show_review
    puts "Please choose from 1 to 6 to select which album you would like to see the review from."
    input = gets.strip.to_i
    if input.between?(1,6)
    TopSix::Scraper.get_review(input - 1).each do |album|
      puts "#{album.review}"
      puts "Score: #{album.rating}"
      end
    else
      puts "Wrong selection. Please try again"
      show_review
    end
  end

  def again?
    puts "Would you like to see the list again 'y'es 'n'o."
    input = gets.strip.downcase
    if input == 'y'
      menu
    elsif input == 'n' || input == 'exit'
      goodbye
    else
      puts "Please make the right selection"
      again?
    end
  end

  def goodbye
    puts "Catch you next time!"
  end


end


 #{album.link}
