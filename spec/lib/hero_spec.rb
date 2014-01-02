require 'spec_helper'
require_relative '../../lib/hero'

describe Hero do

  let(:dicepool) { double('dicepool') }
  let(:attack_action) { double('attack') }
  let(:actions) { { attack: attack_action } }
  let(:hero) { Hero.new dicepool: dicepool, actions: actions }

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

    it 'has attack action' do
      expect(hero.actions[:attack]).to eq(attack_action)
    end
  end
end
