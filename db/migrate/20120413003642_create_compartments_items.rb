class CreateCompartmentsItems < ActiveRecord::Migration

  def change
    create_table :compartments_items do |t|
      t.belongs_to :item

      t.decimal :capacity
      t.decimal :quantity_limit
      t.integer :height
      t.string  :compartment_type,             null: false
      t.string  :description,      limit: 100
      t.string  :item_code,        limit: 50,  null: false
      t.string  :operation,        limit: 1,                default: 'I'
      t.text    :error

      t.timestamps
    end

    add_index :compartments_items, :compartment_type
    add_index :compartments_items, :item_code
  end

end
