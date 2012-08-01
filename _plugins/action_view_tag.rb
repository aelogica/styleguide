class ImageLink < Liquid::Tag
  def initialize(tag_name, image_name, tokens)
     super
     @image_name = image_name
     @asset_type = 'images'
  end

  def render(context)
    if Jekyll::ENV == 'production'
      "#{CONFIG['base_url']}/#{CONFIG['project_name']}/#{@asset_type}/#{@image_name}"
    else
      "/#{@asset_type}/#{@image_name}"
    end
  end
end

Liquid::Template.register_tag('image_link', ImageLink)
