require 'spec_helper'

describe FleeAction do
  let(:hero) do
    double('hero', strength: 3, gain_exp: nil, gain_gold: nil,
           damage: nil, stealth: nil, flee: nil)
  end

  let(:dicepool) { double('dicepool') }
  let(:monster) { double('monster', toughness: 2, kill: nil, damage: 3, notice: nil) }

  subject { FleeAction.new hero, dicepool }

  it_behaves_like 'actionable'

  it 'has stealth attribute' do
    expect(subject.attribute).to eq :stealth
  end

  it 'has notice for difficulty' do
    expect(subject.difficulty).to eq :notice
  end

  describe 'effect' do
    context 'success' do
      before do
        dicepool.stub(:skill_check).and_return(true)
      end

      it 'sends flee message to the owner' do
        hero.should_receive(:flee)
        subject.activate(monster)
      end
    end

    context 'failure' do
      before do
        dicepool.stub(:skill_check).and_return(false)
      end

      it 'deals damage to the owner' do
        hero.should_receive(:damage).with(monster.damage)
        subject.activate(monster)
      end
    end
  end
end
