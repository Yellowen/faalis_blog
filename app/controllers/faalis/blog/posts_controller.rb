require_dependency "faalis/application_controller"

module Faalis::Blog
  class PostsController < ::ApplicationController

    layout Engine.default_layout

    def index
      @posts = Post.published.ordered
      @posts = @posts.where(members_only: false) unless user_signed_in?
      @posts = @posts.page(params[:page]).per(5)
    end

    def show
      posts = Post.published

      if user_signed_in?
        @post = posts.find_by(permalink: params[:permalink])

      else
        @post = posts.where(members_only: false) \
                .find_by(permalink: params[:permalink])
      end
    end

    def create
      @comment = commentable.comments.create

    end

  end
end
