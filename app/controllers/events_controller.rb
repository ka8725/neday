class EventsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    if params[:user_id]
      @events = User.find(params[:user_id]).events.paginate(:page => params[:page])
    else
      @events = Event.paginate(:page => params[:page])
    end
  end

end