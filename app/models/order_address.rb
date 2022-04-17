class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :order_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :order_id
    validates :user_id
    validates :item_id
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end