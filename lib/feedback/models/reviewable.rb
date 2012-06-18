module Feedback
  module Models
    module Reviewable
      # class methods here
      def has_reviews
        has_many :reviews, :as => :reviewable, :class_name => "Feedback::Review", :dependent => :destroy
        send :include, InstanceMethods
      end

      module InstanceMethods
      end
    end
  end
end