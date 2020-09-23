class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :total, null: false
      t.string :unit, null: false
      t.boolean :display, null: false, default: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
    add_index :foods, [ :company_id, :name], unique: true
    
  end
end
