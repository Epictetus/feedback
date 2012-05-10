Rails.application.routes.draw do
  scope :as => "feedback_comment_feedback_comments" do
    match "/feedback/comment/:comment_id/feedback/comments" => "feedback/comments#index", 
            :via => :get
    match "/feedback/comment/:comment_id/feedback/comments" => "feedback/comments#create", 
            :via => :post
  end
  namespace :admin do
    namespace :feedback do
      resources :comments, :only => [:index]
    end
  end
end
