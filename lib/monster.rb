class Monster
  attr_reader :toughness, :damage, :notice, :exp, :gold

  def initialize(attr = {})
    @toughness = attr.fetch(:toughness, 2)
    @damage    = attr.fetch(:damage, 2)
    @notice    = attr.fetch(:notice, 2)
    @exp       = attr.fetch(:exp, 10)
    @gold      = attr.fetch(:gold, 2)
    @dead      = false
  end

  def dead?
    @dead
  end

  def kill
    @dead = true
  end
end
