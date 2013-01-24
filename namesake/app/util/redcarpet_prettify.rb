class RedcarpetPrettify < Redcarpet::Render::HTML
  def postprocess(full_document)
    #full_document.gsub('group', 'froup')
    full_document.gsub('<code>', '<code class="">')
        .gsub(/<code class="([^"]*)">/, '<code class="prettyprint $1">')
  end
end
