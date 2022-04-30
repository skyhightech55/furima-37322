class OrderAddress
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :order_id, :item_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :user_id
    
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :token, presence: true

  

  

  def save
    
    
    order = Order.create(user_id: user_id, item_id: item_id)
    
    DeliverAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, order_id: order.id)
  end
end