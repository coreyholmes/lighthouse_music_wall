class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.references :user
      t.references :song
      t.timestamps null: false
    end
  end
end