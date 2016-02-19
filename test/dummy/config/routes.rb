Rails.application.routes.draw do

  mount Faalis::Blog::Engine => "/faalis_comments"
end
