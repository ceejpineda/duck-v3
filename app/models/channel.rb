class Channel < ApplicationRecord
  belongs_to :category
  has_many :messages
end
