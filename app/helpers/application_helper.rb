module ApplicationHelper
  def bootstrap_flash
    messages = flash.map do |type, msg|
      content_tag :div, msg, class: bootstrap_flash_class(type), role: 'alert'
    end

    messages.join("\n").html_safe
  end

  def bootstrap_flash_class(type)
    type_class = case type
                 when 'notice', 'success' then 'success'
                 when 'alert', 'error' then 'danger'
                 end

    "alert alert-#{type_class}"
  end
end
