class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :null => false
      t.string :slug, :null => false
      t.text :description
      t.integer :organization_id, :null => false

      t.timestamps
    end
  end
end
