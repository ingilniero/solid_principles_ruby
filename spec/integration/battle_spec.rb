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

    context 'when the attack is succesful' do
      before :each do
        Dicepool.any_instance.stub(:roll_die).and_return(5)
        hero.activate_action :attack, monster
      end

      it 'kills monster' do
        expect(monster).to be_dead
      end

      it 'gets monster\'s gold' do
        expect(hero.gold).to eq 20
      end

      it 'gets experience' do
        expect(hero.exp).to eq 10
      end
    end

    context 'when the attack fails' do
      before :each do
        Dicepool.any_instance.stub(:roll_die).and_return(2)
        hero.activate_action :attack, monster
      end

      it 'takes damage' do
        expect(hero.health).to eq 6
      end
    end
  end

  describe 'Hero fless from monster' do
    context 'when the flee attempt is succesful' do
      before do
        Dicepool.any_instance.stub(:roll_die).and_return(5)
        hero.activate_action :flee, monster
      end

      it 'fled' do
        expect(hero.fled?).to be_true
      end
    end

    context 'when the flee attempt fails' do
      before do
        Dicepool.any_instance.stub(:roll_die).and_return(2)
        hero.activate_action :flee, monster
      end

      it 'taked damage' do
        expect(hero.health).to eq 6
      end
    end
  end
end
