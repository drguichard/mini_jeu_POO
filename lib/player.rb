class Player
  attr_accessor :name, :life_points, :player

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_received)
    @life_points -= damage_received #on retire les dommages aux points de vie
    if @life_points <= 0
      puts "#{@name} a été tué."
    end
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damages = compute_damage #stocke les points de dommages
    puts "il lui inflige #{damages} points de dommages"
    player.gets_damage(damages) #envoie dans la methode "gets_damage" l'entrée "damages" en remplacement de "damage_received"
  end

  def compute_damage
    return rand(1..6)
  end



end
