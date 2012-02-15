require 'spec_helper'

describe UsersController do
  it {
    get :index
    response.should be_success
  }
end
