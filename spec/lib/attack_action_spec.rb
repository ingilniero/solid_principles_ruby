require 'spec_helper'

describe AttackAction do
  let(:hero) { double('hero', strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double('dicepool') }
  let(:monster) { double('monster', toughness: 2, kill: nil, damage: 3) }

  subject { AttackAction.new hero }

  it_behaves_like 'actionable'

  it 'has strength attribute' do
    expect(subject.attribute).to eq (:strength)
  end

  it 'has toughness for difficulty' do
    expect(subject.difficulty).to eq (:toughness)
  end

  describe 'effect' do
    before { Dicepool.stub(:new).and_return(dicepool) }

    context 'success' do
      before { dicepool.stub(:skill_check).and_return(true) }

      it 'kills monster' do
        monster.should_receive(:kill)
        subject.activate(monster)
      end

      it 'rewards owner with exp' do
        hero.should_receive(:gain_exp)
        subject.activate(monster)
      end

      it 'rewards owner with gold' do
        hero.should_receive(:gain_gold)
        subject.activate(monster)
      end
    end

    context 'failure' do
      before { dicepool.stub(:skill_check).and_return(false) }

      it 'demages owner' do
        hero.should_receive(:damage).with(monster.damage)
        subject.activate(monster)
      end
    end
  end
end
