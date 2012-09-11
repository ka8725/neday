class User::EventsController < InheritedResources::Base

  def index
    @events = Event.find_all_by_owner_id(current_user)#.paginate(:page => params[:page])
  end

  private
  
  def begin_of_association_chain
    current_user
  end

end