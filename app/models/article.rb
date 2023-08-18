class Article < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_date
  belongs_to :prefecture



  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

end
