class User::EventsController < InheritedResources::Base

  private
  
  def begin_of_association_chain
    User.find_by_id(params[:user_id]) || current_user
  end

end