class AddUsertoGalls < ActiveRecord::Migration[5.0]
  def change
    add_column :galls, :user_id, :integer
    add_column :photos, :gall_id, :integer
    add_foreign_key :galls, :users, index: true
    add_foreign_key :photos, :galls, index: true
  end
end
