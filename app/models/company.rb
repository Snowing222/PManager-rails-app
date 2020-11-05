class Company < ApplicationRecord
    has_many :users

    validates :name, presence:  { message: "must be given please" }
end
