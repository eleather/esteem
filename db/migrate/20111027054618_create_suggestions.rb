class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
