class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :cart_id
      t.integer :meal_id
    end
  end
end
