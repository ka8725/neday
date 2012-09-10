class UsersController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @users = User.paginate(:page => params[:page])
  end

  def created_events
    @events = Event.find_all_by_owner_id(params[:user_id])#.paginate(:page => params[:page])
  end
    
  def involved_events
    @events = User.find(params[:user_id]).events.paginate(:page => params[:page])
  end

end