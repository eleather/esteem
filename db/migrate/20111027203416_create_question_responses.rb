class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.integer :question_id, :null => false
      t.integer :user_id, :null => false
      t.integer :response, :null => false

      t.timestamps
    end
  end
end
