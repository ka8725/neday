class EventsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @events = Event.paginate(:page => params[:page])
  end

  def participate_in_the_event
    
  end

end
