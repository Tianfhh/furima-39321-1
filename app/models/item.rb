class Item < ApplicationRecord

  validates :user, presence: true
  validates :item_name, presence: true
  validates :description, presence: true  
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shippig_fee_id, presence: true
  validates :prefecture_id, presence: true  
  validates :shipping_date_id, presence: true
  validates :price, presence: true

  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

end
