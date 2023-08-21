class Buyer < ApplicationRecord

  attr_accessor :token
  
  validates :token, presence: true

  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  
end
