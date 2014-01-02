require 'spec_helper'

describe FleeAction do
  let(:hero) { double('hero', strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: nil) }
  let(:dicepool) { double('dicepool') }
  let(:monster) { double('monster', toughness: 2, kill: nil, damage: 3, notice: nil) }

  subject { FleeAction.new hero, dicepool }

  it 'responds to activate message' do
    expect(subject).to respond_to(:activate)
  end

  it 'has an owner' do
    expect(subject.owner).to eq(hero)
  end

  describe '#activate' do
    it 'makes stealth check against target notice' do
      dicepool.should_receive(:skill_check).with(hero.stealth, monster.notice)
      subject.activate(monster)
    end
  end

  describe 'effect' do

  end
end
