require 'bundler'
Bundler.require

require_relative 'lib/game' #calls game.rb file
require_relative 'lib/player'

player1 = Player.new("Josiane") #entre un  nouveau joueur avec son prénom
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points >0 #boucle indiquant que tant que les vies ne sont pas à 0 on continue la boucle
puts "Voici l'état de chaque joueur :"
puts " "
puts player1.show_state
puts player2.show_state
puts " "
puts "Passons à la phase d'attaque :"
puts " "
puts player1.attacks(player2)
break if player2.life_points <= 0 #on casse la boucle à cette condition
print player2.attacks(player1)
puts "------------"

end

#binding.pry
