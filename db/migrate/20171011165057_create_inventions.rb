class CreateInventions < ActiveRecord::Migration

  def change
    create_table :inventions do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :inventor_id

      t.timestamps null: false
    end
  end
end
