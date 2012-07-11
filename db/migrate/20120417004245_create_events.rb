class CreateEvents < ActiveRecord::Migration

  def change
    create_table :events do |t|
      t.datetime :operation_at
      t.integer  :compartment_reference
      t.integer  :order_line_reference
      t.decimal  :quantity_executed,     precision: 11, scale: 3
      t.integer  :quantity_requested,    precision: 11, scale: 3
      t.integer  :reference
      t.string   :command,               limit: 5
      t.string   :item_code,             limit: 50
      t.string   :main_order_name,       limit: 20
      t.string   :order_name,            limit: 20
      t.string   :request_type,          limit: 5
      t.string   :sub_code_a,            limit: 50
      t.string   :sub_code_b,            limit: 50

      t.timestamps
    end
  end

end
