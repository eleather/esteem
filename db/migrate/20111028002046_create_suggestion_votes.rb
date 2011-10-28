class CreateSuggestionVotes < ActiveRecord::Migration
  def change
    create_table :suggestion_votes do |t|
      t.integer :suggestion_id, :null => false
      t.integer :user_id, :null => false
      t.integer :vote, :null => false

      t.timestamps
    end
  end
end
