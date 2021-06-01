class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,  null: false
      t.string     :municipality, null: false
      t.string     :street,       null: false
      t.string     :building     
      t.string     :phone,        null: false
      t.integer    :locality_id,  null: false
      t.references :buyer,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
