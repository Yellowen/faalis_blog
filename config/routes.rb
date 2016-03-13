Faalis::Blog::Engine.routes.draw do
  in_dashboard do
    resources :categories
    namespace :blog do
      resources :posts
    end
  end
end
