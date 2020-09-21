class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, unique: true
      t.integer :total, null: false
      t.string :unit, null: false

      t.timestamps
    end
  end
end
