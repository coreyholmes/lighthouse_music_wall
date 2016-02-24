class Votes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_count
      t.references :user
      t.references :song
      t.timestamps null: false
    end
  end
end