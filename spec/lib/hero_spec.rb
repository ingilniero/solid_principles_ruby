require 'spec_helper'

describe Hero do

  let(:attack_action) { double('attack', assign_owner: nil) }
  let(:actions) { { attack: attack_action } }
  let(:hero) { Hero.new actions: actions }

  describe 'default attributes' do

    it 'has default strength equal to "3"' do
      expect(hero.strength).to eq 3
    end

    it 'has default health equal to "10"' do
      expect(hero.health).to eq 10
    end

    it 'has default gold equal to "0"' do
      expect(hero.gold).to eq 0
    end

    it 'has default exp equal to "0"' do
      expect(hero.exp).to eq 0
    end

    it 'has default stealth equal to "2"' do
      expect(hero.stealth).to eq 2
    end
  end

  describe 'custom attributes' do
    let(:hero) { Hero.new(strength: 4, health: 8, stealth: 4) }

    it { expect(hero.strength).to eq 4}

    it { expect(hero.health).to eq 8 }

    it { expect(hero.stealth).to eq 4 }
  end

  describe '#attack' do
    let(:monster) { double('monster') }

    it 'has attack action' do
      expect(hero.actions[:attack]).to eq(attack_action)
    end

    it 'activates attack action' do
      attack_action.should_receive(:activate)
      hero.activate_action(:attack, monster)
    end
  end

  describe '#damage' do
    before do
      hero.damage(3)
      hero.damage(2)
    end

    it 'decrease health' do
      expect(hero.health).to eq 5
    end
  end

  describe '#gain_gold' do
    before { hero.gain_gold(10) }

    it 'increases hero\'s gold' do
      expect(hero.gold).to eq 10
    end
  end

  describe '#gain_exp' do
    before { hero.gain_exp(100) }

    it 'increases hero\'s exp ' do
      expect(hero.exp).to eq 100
    end
  end

  describe '#flee' do
    before { hero.flee }
    it 'changes the flee state of the hero' do
      expect(hero.fled?).to be_true
    end
  end

  describe '#fled?' do
    context 'when the hero flees from battle' do
      before { hero.flee }
      it { expect(hero.fled?).to be_true }
    end

    context 'hen the hero doesn\'t flee' do
      it { expect(hero.fled?).to be_false }
    end
  end

  describe '#own_actions' do
    before { attack_action.should_receive(:assign_owner) }

    it 'sends assign_owner message to each action' do
      hero
    end
  end

  describe '#dead?' do
    context 'when hero is alive' do
      it { expect(hero.dead?).to be_false }
    end

    context 'when hero is dead' do
      before { hero.damage(20) }

      it { expect(hero.dead?).to be_true }
    end
  end

  describe '#reset_flee' do
    before do
      hero.flee
      hero.reset_flee
    end
    it 'sets fled state to false' do
      expect(hero.fled?).to be_false
    end
  end
end
