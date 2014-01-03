class Hero
  attr_reader :strength, :health, :actions, :gold, :exp, :stealth

  def initialize(attr = {})
    @strength = attr.fetch(:strength, 3)
    @health   = attr.fetch(:health, 10)
    @stealth  = attr.fetch(:stealth, 2)
    @actions  = attr.fetch(:actions, {})
    @gold     = 0
    @exp      = 0
    @fled     = false
    own_actions
  end

  def own_actions
    @actions.each_value { |action| action.assign_owner self }
  end

  def activate_action(action_name, target)
    actions[action_name].activate(target)
  end

  def damage(hit)
    @health -= hit
  end

  def gain_gold(amount)
    @gold += amount
  end

  def gain_exp(amount)
    @exp += amount
  end

  def flee
    @fled = true
  end

  def fled?
    @fled
  end

  def dead?
    health <= 0
  end

  def reset_flee
    @fled = false
  end
end
