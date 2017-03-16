class AddDescriptionToGalls < ActiveRecord::Migration[5.0]
  def change
    add_column :galls, :description, :string
  end
end
