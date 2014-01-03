shared_examples 'actionable' do
  it { expect(subject).to respond_to(:action_attributes) }
  it { expect(subject).to respond_to(:success) }
  it { expect(subject).to respond_to(:failure) }
  it { expect(subject).to respond_to(:owner) }
  it { expect(subject).to respond_to(:dicepool) }
  it { expect(subject).to respond_to(:attribute) }
  it { expect(subject).to respond_to(:difficulty) }
end
