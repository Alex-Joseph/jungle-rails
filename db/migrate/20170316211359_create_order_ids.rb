class CreateOrderIds < ActiveRecord::Migration
  def change
    create_table :order_ids do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
