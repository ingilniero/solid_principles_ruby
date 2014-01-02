require 'spec_helper'
require_relative '../../lib/hero'

describe Hero do

  describe 'default attributes' do
    let(:hero) { Hero.new }

    it 'has default strength equal to "3"' do
      expect(hero.strength).to eq 3
    end

    it 'has default health equal to "10"' do
      expect(hero.health).to eq 10
    end
  end

  describe 'custom attributes' do
    let(:hero) { Hero.new(strength: 4, health: 8) }

    it { expect(hero.strength).to eq 4}

    it { expect(hero.health).to eq 8 }
  end

  describe '#attack' do
    context 'when the hero attacks sucessfuly' do
      it { expect(subject.attack(monster)).to be_true }
    end
  end
end
