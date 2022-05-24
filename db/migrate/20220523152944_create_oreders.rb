class CreateOreders < ActiveRecord::Migration[6.1]
  def change
    create_table :oreders do |t|

      t.integer :customer_id
      t.string :shipping_address
      t.string :delivery_name
      t.string :shipping_zip_code
      t.integer :payment_amount
      t.integer :method_of_payment
      t.integer :order_status
      t.integer :postage

      t.timestamps
    end
  end
end
