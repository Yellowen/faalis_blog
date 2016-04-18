Faalis::Blog::Engine.routes.draw do

  get "#{Faalis::Blog::Engine.index_url_prefix}", to: 'blog/posts#index', as: :index

  in_dashboard do
    resources :categories
    resources :posts
  end
end
