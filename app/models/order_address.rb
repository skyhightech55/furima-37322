class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :order_id, :item_id
end