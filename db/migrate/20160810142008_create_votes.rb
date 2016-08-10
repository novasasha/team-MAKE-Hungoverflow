class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voteable_type, { null: false }
      t.integer :voteable_id, { null: false }
      t.integer :user_id, { null: false }
      t.integer :points, { null: false }

      t.timestamps(null: false)
    end
  end
end
