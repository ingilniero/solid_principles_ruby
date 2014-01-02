class AttackAction
  attr_reader :owner, :dicepool

  def initialize(owner, dicepool)
    @owner = owner
    @dicepool = dicepool
  end

  def activate(target)
    if dicepool.skill_check(owner.strength, target.toughness)
      target.kill
    end
  end
end
