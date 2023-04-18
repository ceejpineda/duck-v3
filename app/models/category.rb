class Category < ApplicationRecord
  belongs_to :room
  has_many :channels, dependent: :destroy
end
