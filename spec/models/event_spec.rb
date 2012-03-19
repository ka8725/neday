require 'spec_helper'

describe Event do
  let (:event) {Factory(:event)}
  context 'factory' do
    it {event.should be_valid}
    it {event.should be_persisted}
  end
end
