class CreateInventors < ActiveRecord::Migration

  def change
    create_table :inventors do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
