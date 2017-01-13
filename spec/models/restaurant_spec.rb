require 'rails_helper'

describe Restaurant, type: :model do

  it 'is not valid with a name less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  describe "#average_rating" do
    context "no reviews" do
      it "returns 'N/A' when there are no reviews" do
        restaurant = Restaurant.create(name: "The Ivy")
        expect(restaurant.average_rating).to eq "N/A"
      end
    end

    context "one review" do
      it "returns that rating" do
        user = User.create(email: 'test@test.tt', password: "testest")
        restaurant = Restaurant.new(name: "The Ivy")
        restaurant.user = user
        restaurant.save
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end
    context "multiple reviews" do
      it "returns average rating" do
        user = User.create(email: 'test@test.tt', password: "testest")
        restaurant = Restaurant.new(name: "The Ivy")
        restaurant.user = user
        restaurant.save
        restaurant.reviews.create(rating: 4)
        restaurant.reviews.create(rating: 2)
        expect(restaurant.average_rating).to eq 3
      end
    end
  end

end
