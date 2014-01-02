class Hero
  attr_reader :health, :strength

  def initialize(health, strength)
    @health = health
    @strength = strength
  end

  def dead?
    @health <= 0
  end
end

hero = Hero.new 10, 3
monster = Monster.new 2, 4

until hero.attack(monster) || hero.dead?
  puts "You missed. Monster dealt #{ monster.damage } damage"
  puts "Your current health is #{ hero.health }"
end

puts "=================================="

if hero.dead?
  puts "You LOST"
else
  puts "You WON"
end

puts "=================================="
