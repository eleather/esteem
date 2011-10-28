class CreateQuestionsRadials < ActiveRecord::Migration
  def up
    create_table :questions_radials do |t|
      t.integer :question_id, :null => false
      t.integer :radial_id, :null => false
    end
  end

  def down
    drop_table :questions_radials
  end
end
