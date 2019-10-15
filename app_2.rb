require 'bundler'
Bundler.require

require_relative 'lib/game' #calls game.rb file
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "quel est ton prénom ?"
nom = gets.chomp
user = HumanPlayer.new("#{nom}")

enemies = [(player1 = Player.new("Josiane")), (player2 = Player.new("José"))]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "Ou attaquer un joueur en vue :"
  puts "0 - #{player1.show_state} "
  puts "1 - #{player2.show_state}"
  reply1 = gets.chomp
    if reply1 == "a" then user.search_weapon
    elsif reply1 == "s" then user.search_health_pack
    elsif reply1 == "0" then user.attacks(player1)
    elsif reply1 == "1" then user.attacks(player2)
    end
  puts "appuie sur 'Entrée' pour continuer "
  pause = gets.chomp
  puts "Les autres joueurs t'attaquent !"
   enemies.each do |enemy|
      if enemy.life_points > 0 then enemy.attacks(user)
        break if user.life_points <= 0 || player1.life_points <= 0 || player2.life_points <+ 0 #on casse la boucle à ces conditions
      end
  end
end
#Le jeu doit afficher "La partie est finie" et ensuite soit afficher "BRAVO ! TU AS GAGNE !" si le joueur humain est toujours en vie, ou "Loser ! Tu as perdu !" s'il est mort.

binding.pry
