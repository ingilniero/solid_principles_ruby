require 'spec_helper'
require_relative '../../lib/hero'

describe Hero do

  let(:dicepool) { double('dicepool') }
  let(:hero) { Hero.new dicepool: dicepool }

  describe 'default attributes' do

    it 'has default strength equal to "3"' do
      expect(hero.strength).to eq 3
    end

    it 'has default health equal to "10"' do
      expect(hero.health).to eq 10
    end
  end

  describe 'custom attributes' do
    let(:hero) { Hero.new(strength: 4, health: 8, dicepool: dicepool) }

    it { expect(hero.strength).to eq 4}

    it { expect(hero.health).to eq 8 }
  end

  describe '#attack' do
    let(:monster) { double('monster', toughness: 2) }

    context 'when the hero attacks sucessfuly' do
      before { dicepool.stub(:skill_check).and_return(true) }

      it { expect(hero.attack(monster)).to be_true }
    end

    context 'when the hero attack fails' do
      before { dicepool.stub(:skill_check).and_return(false) }

      it { expect(hero.attack(monster)).to be_false }
    end
  end
end
