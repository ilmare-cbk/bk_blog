class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.string :title
    	t.string :my_image

      t.timestamps null: false
    end
  end
end
