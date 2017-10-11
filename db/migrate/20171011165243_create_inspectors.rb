class CreateInspectors < ActiveRecord::Migration

  def change
    create_table :inspectors do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
