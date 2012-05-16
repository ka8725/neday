require 'spec_helper'

describe Slide do
  let(:slide) { FactoryGirl.create(:slide) }

  context :factory do
    it { slide.should be_valid }
    it { slide.should be_persisted }
  end
end
