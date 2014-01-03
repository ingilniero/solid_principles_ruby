require 'spec_helper'

class TestAction < Action
  def action_attributes
    @attribute  = :strength
    @difficulty = :toughness
  end
end

describe Action do
  let(:hero) { double('hero', strength: 3, gain_xp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double('dicepool', skill_check: nil) }
  let(:monster) { double('monster', toughness: 2, kill: nil, damage: 4) }
  subject { TestAction.new hero, dicepool }

  it_behaves_like 'action'

  it 'requires action attributes to be implementd' do
    expect { Action.new hero, dicepool }.to raise_exception
  end

  describe '#activate' do
    context 'when skill_check returns true' do
      before { dicepool.stub(:skill_check).and_return(true) }

      it 'sends success message' do
        subject.should_receive(:success)
        subject.activate(monster)
      end
    end

    context 'when skill_check returns false' do
      before { dicepool.stub(:skill_checj).and_return(false) }

      it 'sends failure message' do
        subject.should_receive(:failure)
        subject.activate(monster)
      end
    end
  end
end
