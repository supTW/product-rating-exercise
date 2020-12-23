class Product < ApplicationRecord
  has_many :reviews
  
  scope :highest_rated, -> {(
    select("products.id, products.name, products.description, AVG(reviews.rating) as product_rating")
    .joins(:reviews)
    .group("products.id, products.name, products.description")
    .order("reviews.rating DESC")
  )}

  
end
