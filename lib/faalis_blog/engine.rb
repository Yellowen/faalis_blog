if File.exists?([File.expand_path("../../../", __FILE__),
                 ".development"].join("/"))
  $LOAD_PATH <<  File.expand_path('../../../../Faalis/lib', __FILE__)
end

require "faalis"


module FaalisBlog
  class Engine < ::Rails::Engine
  engine_name "faalis_blog"

    ::Faalis::Engine.setup do |config|
      config.models_with_permission = []
    end

    ::Faalis::Plugins.register "faalis_blog", self
    ::Faalis::Engine.dashboard_js_manifest = "faalis_blog/application.js"
    isolate_namespace FaalisBlog
  end
end
