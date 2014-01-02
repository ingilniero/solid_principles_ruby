require 'spec_helper'

describe AttackAction do
  let(:hero) { double('hero', strength: 3) }
  let(:dicepool) { double('dicepool') }
  let(:monster) { double('monster', toughness: 2) }

  subject { AttackAction.new hero, dicepool }

  it 'responds to activate message' do
    expect(subject).to respond_to(:activate)
  end

  it 'has an owner' do
    expect(subject.owner).to eq(hero)
  end

  describe '#activate' do
    it 'makes strength check against target toughbess' do
      dicepool.should_receive(:skill_check).with(hero.strength, monster.toughness)
      subject.activate(monster)
    end
  end
end
