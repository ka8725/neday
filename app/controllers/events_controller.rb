class EventsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @events = Event.paginate(:page => params[:page])
  end

end
