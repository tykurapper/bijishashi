class AddMoreInfo < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :birthday, :date
    add_column :users, :favourite, :string
    add_column :users, :info, :string
    add_column :users, :avatar, :string
    
  end
end
