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
end
