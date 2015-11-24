module ApplicationHelper

  def markdown
    renderer = Redcarpet::Render::HTML.new(render_options = {hard_wrap: true})
    Redcarpet::Markdown.new(renderer, extensions = {autolink: true})
  end

end
