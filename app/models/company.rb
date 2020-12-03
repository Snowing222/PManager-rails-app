class Company < ApplicationRecord
    has_many :users, :dependent => :destroy
    has_many :products, foreign_key: :factory_id
    has_many :production_partners, through: :products, source: :production_partnerroutes
    validates :name, presence:  { message: "must be given please" }
end
