module Feedback
  module Models
    module SoftDeletable
      # class methods here
      def is_soft_deletable
        
        default_scope where(:deleted_at => nil)
        
        def deleted_only
          unscoped.where("deleted_at IS NOT NULL")
        end
        
        send :include, InstanceMethods
      end

      module InstanceMethods
        
        def soft_delete
          self.update_attribute(:deleted_at, Time.now)
        end
        
        def undelete
          self.class.unscoped do
            self.update_attribute(:deleted_at, nil)
          end
        end
        
        def deleted?
          deleted_at.present?
        end
        
      end
    end
  end
end