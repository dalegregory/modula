class CreateOrderOutcomeItems < ActiveRecord::Migration

  def change
    create_table :order_outcome_items do |t|
      t.belongs_to :item
      t.belongs_to :outcome

      t.integer :quantity_requested
      t.string  :item_code
      t.string  :notes
      t.string  :order_name
      t.string  :quantity_executed
      t.string  :sub_code_a
      t.string  :sub_code_b

      t.timestamps
    end
  end

end
