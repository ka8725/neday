require 'spec_helper'

describe Place do
  let(:place) { FactoryGirl.create(:place) }

  context :factory do
    it { place.should be_valid }
    it { place.should be_persisted }
  end
end
