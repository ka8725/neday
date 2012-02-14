module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then 'info'
      when :error then 'error'
      when :alert then 'warning'
    end
  end

  def flash_messages
    res = ''
    [:notice, :error, :alert].each do |level|
      if flash[level].present?
        res << %Q{<div data-alert="alert" class="alert alert-#{flash_class(level)} fade in">
        <a class="close" data-dismiss="alert">&times;</a>
        <p>#{flash[level]}</p>
        </div>}.html_safe
      end
    end
    res.html_safe
  end

  def render_map(location)
    res = ''
    if location.try(:address)
      res << javascript_include_tag("http://api-maps.yandex.ru/1.1/index.xml?key=#{Settings.yandex.api_key}").html_safe
      res << content_tag(:div, nil, :class => 'yandex-map', :style => "width:300px;height:250px").html_safe
      res << javascript_tag do
        %Q{
          YMaps.jQuery(document).ready(function() {
            var map = new YMaps.Map(YMaps.jQuery('.yandex-map')[0]);
            var point = new YMaps.GeoPoint(#{location.longitude}, #{location.latitude});
            map.setCenter(point);
            map.setZoom(15);
            var placemark = new YMaps.Placemark(point);
            placemark.name = '#{location.name}';
            placemark.description = '#{location.address}';
            map.addOverlay(placemark);
          });
        }.html_safe
      end
    end
    res.html_safe
  end
end
