class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.integer :picture_id
    	t.string :user_name
    	t.string :content
    	t.string :password

      t.timestamps null: false
    end
  end
end
