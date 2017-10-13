class AddUsernameToInspectors < ActiveRecord::Migration

  def change
    add_column :inspectors, :username, :string
  end

end
