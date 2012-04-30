Dummy::Application.routes.draw do
  root :to => 'blog_posts#index'
  commentable_routes_for :blog_post
  resources :blog_posts
end
