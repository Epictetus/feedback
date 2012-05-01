module Feedback
  module RouteHelpers
    module Commentable
      def commentable_routes_for(*models)
        models.each do |model|
          resources model, :only => [] do
            namespace :feedback do
              resources :comments, :only => [:index, :create]
            end
          end
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, Feedback::RouteHelpers::Commentable)