class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :status
      t.integer :user_id
      t.integer :reviewable_id
      t.string :reviewable_type
      t.text :body
      t.float :rating
      
      t.datetime :deleted_at

      t.timestamps
    end
    
    add_index :reviews, :user_id
    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end