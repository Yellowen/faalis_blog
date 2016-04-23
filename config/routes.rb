Faalis::Blog::Engine.routes.draw do

  get "#{Faalis::Blog::Engine.index_url_prefix}", to: 'posts#index', as: :index
  get "#{Faalis::Blog::permalink}", to: 'posts#show', as: :show

  in_dashboard do
    resources :categories
    resources :posts
  end
end
