module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
  def markdown(text)
     require 'redcarpet'
     renderer = Redcarpet::Render::HTML.new
     extensions = { :autolink => true }
     markdown = Redcarpet::Markdown.new(renderer, extensions)
     markdown.render(text).html_safe
   end

end
