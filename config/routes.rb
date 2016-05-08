Faalis::Blog::Engine.routes.draw do

  get "#{Faalis::Blog::Engine.posts_url_prefix}", to: 'posts#index', as: :index
  get "#{Faalis::Blog::Engine.posts_url_prefix}/:permalink", to: 'posts#show', as: :post_show
  get "#{Faalis::Blog::Engine.categories_url_prefix}/:permalink", to: 'categories#show', as: :category_show

  in_dashboard do
    resources :categories
    resources :posts
  end
end
