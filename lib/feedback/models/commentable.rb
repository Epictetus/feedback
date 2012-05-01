module Feedback
  module Models
    module Commentable
      # class methods here
      def acts_as_commentable
        has_many :comments, :as => :commentable, :class_name => "Feedback::Comment"
        send :include, InstanceMethods
      end

      module InstanceMethods
      end
    end
  end
end