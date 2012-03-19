require 'spec_helper'

describe User do
  let(:user) {Factory(:user)}

  context 'factory' do
    it {user.should be_valid}
    it {user.should be_persisted}
  end

  context 'associations' do
    let(:event) {Factory.build(:event, :owner => nil)}
    it {lambda {user.events << event}.should change(user.events, :count).by(1)}
    it {lambda {event.owner = user}.should change(event, :owner_id).from(nil).to(user.id)}
  end
end
