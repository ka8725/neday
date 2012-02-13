require 'spec_helper'

describe Slide do
  before(:each) do
    @slide = Factory(:slide)
  end

  it {@slide.should be_valid}
end
