# -*- encoding : utf-8 -*-
class EventMembersController < ApplicationController

  def create
    Event.find(params[:event_id]).members << current_user
    redirect_to :back, :notice => 'Вы идете на событие!'
  end

  def destroy
    event = Event.find(params[:id])
    event.members.delete(current_user)
    redirect_to :back, :notice => 'Вы больше не участвуете в этом событии'
  end
end