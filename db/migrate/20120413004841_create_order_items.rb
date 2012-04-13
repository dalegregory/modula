class CreateOrderItems < ActiveRecord::Migration

  def change
    create_table :order_items do |t|
      t.belongs_to :order

      t.decimal :quantity_requested
      t.string  :item_code,          limit: 50
      t.string  :notes,              limit: 100
      t.string  :order_name,         limit: 20
      t.string  :sub_code_a,         limit: 50
      t.string  :sub_code_b,         limit: 50
      t.text    :error

      t.timestamps
    end

    add_index :order_items, :order_id
    add_index :order_items, :item_code
    add_index :order_items, :order_name
  end

end