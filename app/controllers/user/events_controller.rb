class User::EventsController < InheritedResources::Base

  def index
    @events = Event.find_all_by_owner_id(params[:user_id])#.paginate(:page => params[:page])
  end

  def edit
  	
  end

end