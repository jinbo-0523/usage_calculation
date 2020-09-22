class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.string :name, null: false
      t.boolean :display, null: false, default: true
      t.references :company, null: false, foreign_key: true
      
      t.timestamps
    end
    add_index :ranks, :name, unique: true
  end
end
