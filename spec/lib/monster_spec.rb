require 'spec_helper'

describe Monster do
  let(:monster) { Monster.new toughness: 2, damage: 4 }

   it 'has toughness' do
     expect(monster.toughness).to eq 2
   end

   it 'has damage' do
     expect(monster.damage).to eq 4
   end
end
