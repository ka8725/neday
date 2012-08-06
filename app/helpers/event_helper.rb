module EventHelper
  def time_to_event(event)
    Time.diff(event.start_at, Time.now)[:day]
  end

  def required_members(event)
    event.max_number_members - event.members.count    
  end
end