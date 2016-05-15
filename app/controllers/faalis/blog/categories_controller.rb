require_dependency "faalis/application_controller"

module Faalis::Blog
  class CategoriesController < ::ApplicationController

    layout Engine.default_layout

    def show
      categoris = Category.published

      if user_signed_in?
         @category = categories.find_by(permalink: params[:permalink])
      else
        @category = categories.where(members_only: false).find_by(permalink: params[:permalink])
      end
      @posts = @category.posts.page(params[:page]).per(10)
    end

    def index
      @categoris = Category.published.ordered
      @categoris = @categoris.where(members_only: false) unless user_signed_in?
      @categoris = @categoris.page(params[:page]).per(30)
    end

  end
end
