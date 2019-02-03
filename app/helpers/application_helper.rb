# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_flash_color(flash_type)
    case flash_type.to_sym
    when :error then 'danger'
    when :alert then 'warning'
    when :notice then 'info'
    when :success then 'success'
    else 'secondary'
    end
  end
end
