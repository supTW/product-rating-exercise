class Review < ApplicationRecord
  belongs_to :product
  validates :product_id, :author, :rating, :headline, :presence => true
  validates :rating, { :numericality => true, :inclusion => 1..5 }

  default_scope{ order(created_at: :DESC) }
  scope :highest_rating_first, -> {(
    select("author, :rating, :headline, :created_at")
    .order("rating DESC")
  )}
  scope :newest_rating_first, -> {(
    select("author, :rating, :headline, :created_at")
    .order("created_at DESC")
  )}
end
