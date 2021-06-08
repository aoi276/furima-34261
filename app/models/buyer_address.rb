class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :locality_id, :municipality, :street, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :locality_id, numericality: { other_than: 1 }
    validates :municipality
    validates :street
    validates :phone, format: { with: /\A\d[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, locality_id: locality_id, municipality: municipality, street: street, building: building, phone: phone, buyer_id: buyer.id)
  end

end