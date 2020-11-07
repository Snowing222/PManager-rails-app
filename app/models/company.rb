class Company < ApplicationRecord
    has_many :users, :dependent => :destroy

    validates :name, presence:  { message: "must be given please" }
end
