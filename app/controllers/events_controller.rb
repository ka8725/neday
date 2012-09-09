class EventsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @events = Event.paginate(:page => params[:page])
    render '/shared/_events_list'
  end

  def create(options={}, &block)
      object = build_resource

      object.owner_id=current_user.id

      if create_resource(object)
        options[:location] ||= smart_resource_url
      end

      respond_with_dual_blocks(object, options, &block)
  end

end