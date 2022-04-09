class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #has_one :order
  belongs_to :user
  has_one_attached :image
  belongs_to :prefecture
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_day
  
  
  validates :name, :introduction, :item_category, :item_condition, :shipping_cost, :shipping_day,
  :prefecture, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    validates :price, numericality: { only_integer: true, message: "Half-width number." }
  
  
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  end