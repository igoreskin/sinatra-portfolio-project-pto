class CreateInventionCategories < ActiveRecord::Migration

  def change
    create_table :invention_categories do |t|
      t.integer :invention_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
