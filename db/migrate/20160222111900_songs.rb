class Songs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song
      t.string :artist
      t.string :url
      t.timestamps null: false
    end
  end
end