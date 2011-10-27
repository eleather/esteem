class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title, :null => false
      t.text :description
      t.integer :project_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
