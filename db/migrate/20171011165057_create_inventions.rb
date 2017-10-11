class CreateInventions < ActiveRecord::Migration

  def change
    create_table :inventions do |t|
      t.name :string
      t.text :description
      t.string :status
      t.integer :inventor_id

      t.timestamps null: false
    end
  end
end
