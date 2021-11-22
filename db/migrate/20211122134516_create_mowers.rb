class CreateMowers < ActiveRecord::Migration[6.1]
  def change
    create_table :mowers do |t|
      t.float :price_per_day
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
