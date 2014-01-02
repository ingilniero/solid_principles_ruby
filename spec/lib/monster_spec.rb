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
     context 'when is alive' do
       it { expect(monster.dead?).to be_false }
     end

     context 'when is dead' do
       before { monster.kill }
       it { expect(monster.dead?).to be_true }
     end
   end

   describe '#kill' do
     before { monster.kill }

     it 'kills the monster' do
       expect(monster.dead?).to be_true
     end
   end
end
