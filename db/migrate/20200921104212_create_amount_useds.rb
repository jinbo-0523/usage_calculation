class CreateAmountUseds < ActiveRecord::Migration[6.0]
  def change
    create_table :amount_useds do |t|
      t.date :date, null: false
      t.integer :sale, null: false
      t.references :recipe, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
