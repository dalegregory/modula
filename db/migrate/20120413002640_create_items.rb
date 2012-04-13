class CreateItems < ActiveRecord::Migration

  def change
    create_table :items do |t|
      t.string :code,        limit: 50,  null: false
      t.string :description, limit: 100
      t.string :error

      t.timestamps
    end

    add_index :items, :code
  end

end
