module Faalis::Blog
  class LatestPostsTag < ::Faalis::Liquid::RenderTag
    tag_name 'latest_posts'
    view     'tags/faalis/blog/latest_posts'

    def before_render(context)
      @post = "Asdasdassdasdasd"
    end
  end
end
