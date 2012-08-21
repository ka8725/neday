class EventMembersController < ApplicationController

  def create
    Event.find(params[:event_id]).members << current_user
    redirect_to :back
  end

  def destroy
    event = Event.find(params[:id])
    event.members.delete(current_user)
    redirect_to :back
  end
end