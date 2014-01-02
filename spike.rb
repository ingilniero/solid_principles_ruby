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
