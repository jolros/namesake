class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :rendered_content

  default_scope order('created_at DESC')

  before_save :render_content

  private
  def render_content
    require 'redcarpet'
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    self.rendered_content = redcarpet.render self.content
  end
end