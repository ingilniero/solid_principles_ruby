require 'spec_helper'

class TestAction < Action
  def action_attributes
    @attribute  = :strength
    @difficulty = :toughness
  end
end

describe Action do
  let(:hero) { double('hero', strength: 3, gain_xp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double('dicepool') }
  let(:monster) { double('monster', toughness: 2, kill: nil, damage: 4) }
  subject { TestAction.new hero, dicepool }

  it_behaves_like 'action'
end
