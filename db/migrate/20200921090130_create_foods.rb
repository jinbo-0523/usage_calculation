class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :total, null: false
      t.string :unit, null: false
      t.boolean :display, null: false, default: true

      t.timestamps
    end
    add_index :foods, :name, unique: true
  end
end
