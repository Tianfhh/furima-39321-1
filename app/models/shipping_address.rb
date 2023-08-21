class ShippingAddress < ApplicationRecord

  belongs_to :buyer

 # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
 # validates :prefecture_id, presence: true, numericality: { other_than: 0 }  
 # validates :city, presence: true
 # validates :house_number , presence: true
 # validates :phone_number, presence: true



end
