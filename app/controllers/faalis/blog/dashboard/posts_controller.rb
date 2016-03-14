class Faalis::Blog::Dashboard::PostsController < ::Dashboard::ApplicationController
  engine 'Faalis::Blog::Engine'

  in_form do |f|
    f.attributes except: [:user, :likes, :views, :dislikes]
  end

  private

  def create_hook(resource)
    resource.user = current_user
  end
end
