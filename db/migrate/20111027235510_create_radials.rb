class CreateRadials < ActiveRecord::Migration
  def change
    create_table :radials do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :project_id, :null => false

      t.timestamps
    end
  end
end
