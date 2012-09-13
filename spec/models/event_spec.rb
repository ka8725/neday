require 'spec_helper'

describe Event do
  let (:event) { FactoryGirl.create(:event) }

  it { should have_db_index(:owner_id) }
  it { should have_db_index(:sport_id) }
  it { should have_db_index(:place_id) }

  context :associations do
    it { should belong_to(:place) }
    it { should belong_to(:owner) }
    it { should belong_to(:sport) }
  end

  context :validations do
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:start_at) }
  end

  context 'factory' do
    it { event.should be_valid }
    it { event.should be_persisted }
  end

  it do
    u = FactoryGirl.create(:user)
    event = u.events.create(FactoryGirl.attributes_for(:event).merge(:place_id => 1, :sport_id => 1))
    event.should be_valid
    event.owner_id.should be_present
  end

end
