class Room < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :categories, dependent: :destroy
    after_create_commit { broadcast_append_to "rooms" }
end
