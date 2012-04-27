Dummy::Application.routes.draw do
  commentable_routes_for :blog_post
  resources :blog_post
end
