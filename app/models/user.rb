class User < ApplicationRecord
    has_and_belongs_to_many :rooms
    has_many :messages, dependent: :destroy
    has_many :logs

    def authenticate(password)
        self.password == password
    end
end
