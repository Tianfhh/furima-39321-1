class Category < ApplicationRecord
  
  has_many :items

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end
