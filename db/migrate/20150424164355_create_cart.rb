class CreateCart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.boolean :buy
    end
  end
end
