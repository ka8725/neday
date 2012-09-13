class User::VisitedEventsController < InheritedResources::Base
 
  private
  
  def begin_of_association_chain
    User.find_by_id(params[:user_id])
  end

end