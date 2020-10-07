class RenameOrderColumnTo < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :order, :count
  end
end
