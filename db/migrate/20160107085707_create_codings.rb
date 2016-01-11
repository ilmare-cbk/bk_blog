class CreateCodings < ActiveRecord::Migration
  def change
    create_table :codings do |t|
    	t.integer :project_id
    	t.string :title
    	t.text :content
      t.timestamps null: false
    end
  end
end
