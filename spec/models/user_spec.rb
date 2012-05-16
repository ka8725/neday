require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.create(:user)}

  context 'factory' do
    it { user.should be_valid }
    it { user.should be_persisted }
  end

  context 'associations' do
    it { should have_many(:events) }
  end
end
