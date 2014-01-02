class Monster
  attr_reader :toughness, :damage, :notice

  def initialize(attr = {})
    @toughness = attr.fetch(:toughness, 2)
    @damage = attr.fetch(:damage, 2)
    @notice = attr.fetch(:notice, 2)
    @dead = false
  end

  def dead?
    @dead
  end

  def kill
    @dead = true
  end
end
