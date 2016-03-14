Faalis::Blog::Engine.routes.draw do
  in_dashboard do
    resources :categories
    resources :posts
  end
end
