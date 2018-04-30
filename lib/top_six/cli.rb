#CLI UI

class TopSix::CLI

  def call
    puts "Welcome to top 6!"
    top_albums
    menu
    goodbye
  end

  def top_albums
    puts "------TOP ALBUMS-----------"
    puts "1. Teen Spirit - Nirvana - Grunge\n2. Care For Me - Saba - rap"
  end

  def menu
    puts "Pick using your keyboard to get more information about the album"

    input = ''
    while input != "exit"
      puts "-----------------"
      puts "Please enter 1-6 to see more details.\nType'list' to see the list again.\nType 'exit' to exit"
    input = gets.strip.downcase
      case input
      when "1"
        puts 'Nirvana abstrackt review'
        puts 'Rating: 8.6'
      when "2"
        puts 'Saba abstrackt review'
        puts "Rating: 9.1"
      when "list"
        top_albums
      else
        puts "Please make a right choice"
      end
    end
  end

  def goodbye
    puts "Catch you next time!"
  end


end
