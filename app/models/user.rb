class User < ApplicationRecord
    has_many :production_products, class_name: "Product", foreign_key: :production_partner_id
    has_many :design_products, class_name: "Product",  foreign_key: :design_partner_id
    has_many :manufacture_products, class_name: "Product", foreign_key: :manufacture_partner_id
    belongs_to :company, optional: true
    has_secure_password
    enum role: [:PRODUCTION_PARTNER, :DESIGN_PARTNER, :MANUFACTURE_PARTNER]
    validates :email, presence: true, uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash[:info][:email]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end


end
