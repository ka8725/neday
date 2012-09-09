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
    it { should validate_presence_of(:sport) }
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:start_at) }
  end

  context 'factory' do
    it { event.should be_valid }
    it { event.should be_persisted }
  end
end
