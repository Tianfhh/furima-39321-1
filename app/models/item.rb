class Item < ApplicationRecord

  
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true  
  validates :shipping_date_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, numericality: { only_integer: true }

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date




  has_one_attached :image

  validates :image, presence: true
  
  






  
end
