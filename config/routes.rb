Faalis::Blog::Engine.routes.draw do
  in_dashboard do
    namespace :blog do
      resources :posts
    end
  end
end
