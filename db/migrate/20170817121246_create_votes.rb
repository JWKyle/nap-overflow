class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :voter_id, null: false

      t.timestamps
    end
  end
end
