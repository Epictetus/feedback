module Feedback
  module Models
    module Commentable
      # any method placed here will apply to the classes
      def acts_as_commentable
        send :include, InstanceMethods
      end

      module InstanceMethods
        # any method placed here will apply to instances
      end
    end
  end
end