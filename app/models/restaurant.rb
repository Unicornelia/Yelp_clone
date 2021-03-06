class Restaurant < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true

  def belongs_to_user?(user)
    self.user == user
  end

  def average_rating
    return "N/A" if reviews.none?
    reviews.inject(0) { |memo, review| memo + review.rating } / reviews.length
  end

end
