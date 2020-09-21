class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name, null:false, unique: true
      t.references :campany, foreign_key: true

      t.timestamps
    end
  end
end
