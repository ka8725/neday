module ApplicationHelper
  FLASH_TYPES = {:notice => 'info', :error => 'error', :alert => 'warning'}.freeze

  def flash_class(level)
    FLASH_TYPES[level]
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

  def init_yandex_map
    raise "Yandex map already initialized" if @yandex_map_initialized # It is impossible to initialize map twice
    res = javascript_tag do
      %Q{
        $(document).ready(function() {
          if ($('.yandex-map').length) {
            window.map = new YandexMap('#{Settings.yandex.api_key}');
          }
        });
      }.html_safe
    end
    @yandex_map_initialized = true
    res.html_safe
  end

  def add_location_to_map(location)
    return if !location || location.address.blank?
    content_for :js do
      javascript_tag do
        %Q{
          $(document).ready(function() {
            window.map.addPointToMap({latitude : #{location.latitude}, longitude : #{location.longitude}, title : '#{location.name}', description : '#{location.address}'});
          });
        }.html_safe
      end
    end
  end

  def input_prepend(symbol_class, &block)
    content_tag :div, :class => 'input-prepend' do
      html = content_tag(:span, content_tag(:div, nil, :class => symbol_class), :class => 'add-on')
      html << with_output_buffer(&block) if block_given?
      html
    end
  end
end
