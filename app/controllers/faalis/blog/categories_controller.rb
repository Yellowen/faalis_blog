require_dependency "faalis/application_controller"

module Faalis::Blog
  class CategoriesController < ::ApplicationController

    layout Engine.default_layout

    def show
      @category = Category.find_by(permalink: params[:permalink])
    end
  end
end
