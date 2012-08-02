class ImageLink < Liquid::Tag
  CONFIG = YAML.load_file("_config.yml")

  def initialize(tag_name, image_name, tokens)
     super
     @image_name = image_name
     @asset_type = 'images'
  end

  def render(context)
    if Jekyll::ENV == 'development'
      "/#{@asset_type}/#{@image_name}"
    else
      "http://#{CONFIG['base_url']}/#{CONFIG['project_name']}/#{@asset_type}/#{@image_name}"
    end
  end
end

Liquid::Template.register_tag('image_link', ImageLink)
