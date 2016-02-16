module Faalis
  module Blog
    class Engine < ::Rails::Engine
      isolate_namespace Faalis::Blog

      engine_name 'faalis_blog'
    end
  end
end
