class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :status
      t.integer :user_id
      t.integer :commentable_id
      t.string :commentable_type
      t.text :body

      t.timestamps
    end
  end
end
