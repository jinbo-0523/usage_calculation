class ChangeColumnToOrder < ActiveRecord::Migration[6.0]
  def change
    def down
      change_column_default :orders, :count, 0
    end
    def up
      change_column_default :orders, :count, nil
    end
  end
end
