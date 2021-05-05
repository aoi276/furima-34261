class AddSecondKnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :second_kname, :string
  end
end
