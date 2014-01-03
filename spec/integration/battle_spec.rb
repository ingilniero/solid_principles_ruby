require 'spec_helper'

describe 'Battle' do
  let(:hero) { Hero.new strength: 5,
                        health:   10,
                        actions: {
                          attack: AttackAction.new,
                          flee: FleeAction.new
                        }

             }

  let(:monster) { Monster.new toughness: 2,
                             notice: 1,
                             damage: 4,
                             exp: 10,
                             gold: 20
                }

  let(:dicepool) { Dicepool.new }

  describe 'Hero attacks monster' do
    before { hero.activate_action :attack, monster }

    it 'kills monster' do
      expect(monster).to be_dead
    end

    it 'gets monster\'s gold'
    it 'gets experience'
  end
end
