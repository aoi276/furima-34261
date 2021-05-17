class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :burden
  belongs_to :locality
  belongs_to :delivery
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :item_name
    validates :text
    validates :image
    validates :price

    validates :state_id,    numericality: { other_than: 1 }
    validates :burden_id,   numericality: { other_than: 1 }
    validates :locality_id, numericality: { other_than: 1 }
    validates :delivery_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
  end
end
