class User::VisitedEventsController < InheritedResources::Base
 
  belongs_to :user, :finder => :find_by_id!, :param => :user_id

end