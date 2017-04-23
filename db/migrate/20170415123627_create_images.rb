class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :title
      t.string :file
      t.datetime :created_at
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
