class Room < ApplicationRecord
    has_many :categories, dependent: :destroy
    after_create_commit { broadcast_append_to "rooms" }
end
