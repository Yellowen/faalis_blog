Faalis::Blog::Engine.routes.draw do
  namespace :blog do
  get 'posts/index'
  end

  namespace :blog do
  get 'posts/show'
  end

  in_dashboard do
    resources :categories
    resources :posts
  end
end
