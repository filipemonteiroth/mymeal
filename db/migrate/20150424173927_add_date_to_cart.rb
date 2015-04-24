class AddDateToCart < ActiveRecord::Migration
  def change
    add_column :carts, :buy_date, :date
  end
end
