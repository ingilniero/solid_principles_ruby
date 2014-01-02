require 'spec_helper'

describe Dicepool do
  describe '#skill_check' do
    context 'when number of successes is more than difficulty' do
      before do
        subject.stub(:roll_die).and_return(5)
      end

      it { expect(subject.skill_check(3,2)).to be_true }
    end

    context 'when number of success is less than difficulty' do
      before do
        subject.stub(:roll_die).and_return(2)
      end

      it { expect(subject.skill_check(3, 3)).to be_false }
    end
  end
end
