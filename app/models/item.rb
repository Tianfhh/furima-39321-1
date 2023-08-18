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


  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
