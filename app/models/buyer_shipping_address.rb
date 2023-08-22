class BuyerShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_number 
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Phone number is invalid. Input only 10 or 11 digits." }
    validates :user_id
    validates :item_id
  end

  

  def save
    # binding.pry
    buyer = Buyer.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)

  end

end