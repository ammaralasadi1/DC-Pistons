class Category < ApplicationRecord
  has_many :articles
  has_many :cars
end
