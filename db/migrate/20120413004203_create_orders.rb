class CreateOrders < ActiveRecord::Migration

  def change
    create_table :orders do |t|
      t.boolean :suspended,                           default: false
      t.string  :command,     limit: 5
      t.string  :description, limit: 50
      t.string  :name,        limit: 20, null: false
      t.string  :operation,   limit: 1,               default: 'I'
      t.text    :error

      t.timestamps
    end

    add_index :orders, :name
    add_index :orders, :operation
  end

end
