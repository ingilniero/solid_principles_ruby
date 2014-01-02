require 'spec_helper'

describe AttackAction do
  let(:hero) { double('hero') }

  subject { AttackAction.new hero }

  it 'responds to activate message' do
    expect(subject).to respond_to(:activate)
  end

  it 'has an owner' do
    expect(subject.owner).to eq(hero)
  end
end
