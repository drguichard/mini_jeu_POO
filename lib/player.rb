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



class HumanPlayer < Player
attr_accessor :weapon_level

  def initialize(player_name)
    @name = player_name
    @life_points = 100
    @weapon_level = 1
    #super(name) #fait théoriquement appel au initialize de la classe Player mais marche pas...
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    found_weapon_level = dice
    puts "Tu as trouvé une arme de niveau #{found_weapon_level}"
    if found_weapon_level > weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      return @weapon_level = found_weapon_level
    else puts "M@*#$... elle n'est pas mieux cette arme"
    end
  end

  def search_health_pack
    healthpack = rand(1..6)
    if healthpack == 1
      puts "Tu n'as rien trouvé... "
    elsif healthpack == 2 || 3 || 4 || 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      return @life_points += 50
    else
      puts "Bravo, tu as trouvé un pack de +80 points de vie !!!"
      return @life_points += 80
    end

    if @life_points > 100
      return @life_points == 100
    end

  end


end
