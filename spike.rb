class Hero
  attr_reader :health, :strength

  def initialize(health, strength)
    @health = health
    @strength = strength
  end

  def dead?
    @health <= 0
  end

  def attack(monster)
    dice = []
    strength.times { dice << 1 + rand(6) }
    success = dice.count { |die| die > 4 }

    if success >= monster.toughness
      return true
    else
      @health -= monster.damage
      return false
    end
  end
end

class Monster
  attr_reader :toughness, :damage

  def initialize(toughness, damage)
    @toughness = toughness
    @damage = damage
  end
end

hero = Hero.new 10, 3, 2
monster = Monster.new 2, 4, 2

until hero.attack(monster) || hero.dead? || hero.fled?
  puts "You missed. Monster dealt #{ monster.damage } damage"
  puts "Your current health is #{ hero.health }"

  puts "Trying to flee"
  hero.flee(monster)
end

puts "=================================="

if hero.dead?
  puts "You LOST"
elsif hero.fled?
  puts "You COWARD"
else
  puts "You WON"
end

puts "=================================="
