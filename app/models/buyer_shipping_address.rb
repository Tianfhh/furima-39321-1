class BuyerShipping_address
  include ActiveModel::Model
  attr_accessor :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number


end