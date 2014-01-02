require 'spec_helper'

describe Monster do
  let(:monster) { Monster.new toughness: 2, damage: 4 }

   it 'has toughness' do
     expect(monster.toughness).to eq 2
   end

   it 'has damage' do
     expect(monster.damage).to eq 4
   end

   describe '#dead?' do
     it 'checks if the monster is dead' do
       expect(monster.dead?).to be_false
     end
   end
end
