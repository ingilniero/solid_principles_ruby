require 'spec_helper'

class TestAction
  include Actionable
  def action_attributes
    @attribute  = :strength
    @difficulty = :toughness
  end
end

class AnotherAction
  include Actionable
end

describe Actionable do
  let(:hero) { double('hero', strength: 3, gain_xp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double('dicepool', skill_check: nil) }
  let(:monster) { double('monster', toughness: 2, kill: nil, damage: 4) }
  subject { TestAction.new hero }

  it_behaves_like 'actionable'

  it 'requires action attributes to be implementd' do
    expect { AnotherAction.new hero, dicepool }.to raise_exception
  end

  describe '#activate' do
    before { Dicepool.stub(:new).and_return(dicepool) }

    context 'when skill_check returns true' do
      before do
        dicepool.stub(:skill_check).and_return(true)
      end

      it 'sends success message' do
        subject.should_receive(:success)
        subject.activate(monster)
      end
    end

    context 'when skill_check returns false' do
      before { dicepool.stub(:skill_check).and_return(false) }

      it 'sends failure message' do
        subject.should_receive(:failure)
        subject.activate(monster)
      end
    end
  end
end
