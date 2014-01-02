class AttackAction
  attr_reader :owner, :dicepool, :attribute, :difficulty

  def initialize(owner, dicepool)
    @owner = owner
    @dicepool = dicepool

    @attribute = :strength
    @difficulty = :toughness
  end

  def activate(target)
    if dicepool.skill_check(owner.send(attribute), target.send(difficulty))
      success(target)
    else
      failure(target)
    end
  end

  private

  def success(target)
    target.kill
    owner.gain_exp
    owner.gain_gold
  end

  def failure(target)
    owner.damage(target.damage)
  end
end
