class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :burden
  belongs_to :locality
  belongs_to :delivery
  belongs_to :category
  belongs_to :user
  has_one :buyer
  has_many_attached :images
  
  with_options presence: true do
    validates :user
    validates :item_name
    validates :text
    validates :images
    validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ },
                      inclusion: { in: 300..9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :state_id
      validates :burden_id
      validates :locality_id
      validates :delivery_id
      validates :category_id
    end
  end
end
