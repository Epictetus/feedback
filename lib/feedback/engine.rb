module Feedback
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
    
    initializer "feedback.active_record" do
      ActiveSupport.on_load(:active_record) do
        extend Feedback::Models::Commentable
      end
    end
  end
end
