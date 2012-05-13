module Feedback
  module Models
    module Commentable
      # class methods here
      def has_comments
        has_many :comments, :as => :commentable, :class_name => "Feedback::Comment", :dependent => :destroy
        send :include, InstanceMethods
      end

      module InstanceMethods
      end
    end
  end
end