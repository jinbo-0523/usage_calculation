class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
