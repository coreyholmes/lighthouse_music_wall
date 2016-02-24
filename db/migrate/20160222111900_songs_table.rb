class SongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :url
      t.references :user
      t.timestamps null: false
    end
  end
end