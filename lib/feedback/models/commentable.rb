module Feedback
  module Models
    module Commentable
      # class methods here
      def acts_as_commentable
        send :include, InstanceMethods
      end

      module InstanceMethods
        # instance methods here
      end
    end
  end
end