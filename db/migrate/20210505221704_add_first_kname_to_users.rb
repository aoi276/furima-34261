class AddFirstKnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_kname, :string
  end
end
