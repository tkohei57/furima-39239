class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :municipalities
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only half-width number' }
    validates :token
  end
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                    building: building, phone_number: phone_number, order_id: order.id)
  end
end
