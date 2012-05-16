require 'spec_helper'

describe EventsController do
  it {
    get :new
    response.should be_true
  }
end
