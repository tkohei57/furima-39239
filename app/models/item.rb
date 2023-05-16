class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
end
