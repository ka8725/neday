class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :find_user, :only => %w(show edit update)

  def show
    respond_with(@user)
  end

  def edit
    respond_with(@user)
  end
  def update
    respond_with(@user)
  end

  def index
    @users = User.all
    respond_with(@users)
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
