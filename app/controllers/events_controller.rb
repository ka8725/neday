class EventsController < ApplicationController
  load_and_authorize_resource

  def new
    @event = Event.new
    respond_with(@event)
  end

  def create
    @event = Event.new(params[:event])
    @event.save
    respond_with(@event)
  end
end
