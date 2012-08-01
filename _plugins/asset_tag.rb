# from http://mikeferrier.com/2011/04/29/blogging-with-jekyll-haml-sass-and-jammit/
class AssetTag < Liquid::Tag

  CONFIG = YAML.load_file("_config.yml")

  def initialize(tag_name, name, kind, tokens)
    super tag_name, name, tokens
    @name   = name.to_s.strip
    @kind   = kind.to_s
  end

  def render(context)
    if Jekyll::ENV == 'development'
      markup "/#{@asset_type}/#{name_with_ext}"
    else
      markup "/#{CONFIG['base_url']}/#{CONFIG['project_name']}/#{@asset_type}/#{name_with_ext}"
    end
  end

  def name_with_ext
    "#{@name}.#{@ext}"
  end

end

class IncludeJsTag < AssetTag
  def initialize(tag_name, name, tokens)
    @ext = 'js'
    @asset_type = 'javascripts'
    super tag_name, name, @ext, tokens
  end

  def markup(src)
    %{ <script src='#{src}' type='text/javascript'></script> }.to_s
  end
end

Liquid::Template.register_tag('include_js', IncludeJsTag)

class IncludeCssTag < AssetTag
  def initialize(tag_name, name, tokens)
    @ext = 'css'
    @asset_type = 'stylesheets'
    super tag_name, name, @ext, tokens
  end

  def markup(src)
    %{ <link href='#{src}' media='screen' rel='stylesheet' type='text/css'> }.to_s
  end
end

Liquid::Template.register_tag('include_css', IncludeCssTag)
