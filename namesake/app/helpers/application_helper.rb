module ApplicationHelper
 def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def markdown(text)
    rnder = RedcarpetPrettify.new(:hard_wrap => true)
    mkdwn = Redcarpet::Markdown.new(rnder, :no_intra_emphasis => true, :fenced_code_blocks => true, :space_after_headers => true)
    mkdwn.render(text).html_safe
  end
end
