class CreateAmounts < ActiveRecord::Migration[6.0]
  def change
    create_table :amounts do |t|
      t.date :date, null: false
      t.integer :sale, null: false
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    # 各店舗が同じ日付けの使用量のレコードを保存できないようにする
    add_index :amounts, [:shop_id, :date], unique: true
  end
end
