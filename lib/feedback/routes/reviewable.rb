module Feedback
  module RouteHelpers
    module Reviewable
      def reviewable_routes_for(*models)
        models.each do |model|
          resources model, :only => [] do
            namespace :feedback do
              resources :reviews, :only => [:index, :create]
            end
          end
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, Feedback::RouteHelpers::Reviewable)