module ApplicationHelper

  def markdown
    renderer = Redcarpet::Render::HTML.new(render_options = {hard_wrap: true, highlight: true, quote: true})
    Redcarpet::Markdown.new(renderer, extensions = {autolink: true, safe_links_only: true})
  end

end
