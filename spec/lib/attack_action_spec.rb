require 'spec_helper'

describe AttackAction do
  it 'responds to activate message' do
    expect(subject).to respond_to(:activate)
  end
end
