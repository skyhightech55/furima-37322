class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  has_one :order
  belongs_to :user
  has_one_attached :image
  belongs_to :prefecture
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_day

  validates :name, :introduction, :item_category_id, :item_condition_id, :shipping_cost_id, :shipping_day_id, 
  :prefecture_id, :price, :user, presence: true

  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
end
