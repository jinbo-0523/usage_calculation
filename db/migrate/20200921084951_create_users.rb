class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :employee_id
      t.references :rank, null: false, foreign_key: true
      t.boolean :display, null: false, default: true

      t.timestamps
    end
    add_index :users, :employee_id
  end
end
