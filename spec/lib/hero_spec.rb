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
end
