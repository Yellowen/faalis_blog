module Faalis
  module Comments
    class Engine < ::Rails::Engine
      isolate_namespace Faalis::Comments

      engine_name 'faalis_comments'
    end
  end
end
