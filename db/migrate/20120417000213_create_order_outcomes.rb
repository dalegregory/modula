class CreateOrderOutcomes < ActiveRecord::Migration

  def change
    create_table :order_outcomes do |t|
      t.belongs_to :order

      t.boolean :delete_order,            default: false
      t.integer :store_number
      t.string  :command,      limit: 5
      t.string  :description,  limit: 50
      t.string  :order_name,   limit: 20
      t.string  :status,       limit: 5

      t.timestamps
    end
  end

end
