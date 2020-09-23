class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.date :date, null: false
      t.integer :sale, null: false
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    # 各店舗が同じ日付けの使用量のレコードを保存できないようにする。複合キー
    add_index :reports, [:shop_id, :date], unique: true
  end
end
