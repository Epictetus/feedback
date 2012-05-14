Rails.application.routes.draw do
  scope :as => "feedback_comment_feedback_comments" do
    match "/feedback/comment/:comment_id/feedback/comments" => "feedback/comments#index", 
            :via => :get
    match "/feedback/comment/:comment_id/feedback/comments" => "feedback/comments#create", 
            :via => :post
  end
  namespace :feedback do
    namespace :admin do
      resources :comments, :only => [:index, :update, :destroy] do
        post "mass_assign", :on => :collection
      end
    end
  end
end
