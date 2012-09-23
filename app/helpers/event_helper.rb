module EventHelper
  def time_before_event(event)
    Time.diff(event.start_at, Time.now)[:day]
  end

end
