module Comments
  # any method placed here will apply to the classes
  def acts_as_commentable
    send :include, InstanceMethods
  end

  module InstanceMethods
    # any method placed here will apply to instances
  end
end

ActiveRecord::Base.extend Comments