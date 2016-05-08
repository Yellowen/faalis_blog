require_dependency "faalis/application_controller"

module Faalis::Blog
  class PostsController < ::ApplicationController

    layout Engine.default_layout

    def index
      @posts = Post.published.ordered.page params[:page]
    end

    def show
      @post = Post.published.find_by(permalink: params[:permalink])

    end
  end
end
