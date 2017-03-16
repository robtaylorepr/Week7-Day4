class CreateGalls < ActiveRecord::Migration[5.0]
  def change
    create_table :galls do |t|
      t.string :title

      t.timestamps
    end
  end
end
