require 'spec_helper'

describe Monster do
  let(:monster) { Monster.new toughness: 2, damage: 4, notice: 2 }

   it 'has toughness' do
     expect(monster.toughness).to eq 2
   end

   it 'has damage' do
     expect(monster.damage).to eq 4
   end

   it 'has notice' do
     expect(monster.notice).to eq 2
   end

   it 'has exp to give when it dies' do
     expect(monster.exp).to eq 10
   end

   it 'has gold to give when it dies' do
     expect(monster.gold).to eq 2
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
