module ApplicationHelper

  def markdown
    renderer = Redcarpet::Render::HTML.new(render_options = {hard_wrap: true, with_toc_data: true, safe_links_only: true, highlight: true})
    Redcarpet::Markdown.new(renderer, extensions = {autolink: true, strikethrough: true, quote: true})
  end

end
