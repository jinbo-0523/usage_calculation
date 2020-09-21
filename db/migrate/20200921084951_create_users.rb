class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :employee_number, null: false, unique: true, default: "000000"
      t.references :rank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
