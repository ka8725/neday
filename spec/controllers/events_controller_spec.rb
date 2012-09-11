require 'spec_helper'

describe EventsController do

  context 'persisted' do
    let(:event) { FactoryGirl.create(:event) }
    before(:each) { event }

    it {
      get :show, :id => event.id
      response.should be_success
    }
  end
end
