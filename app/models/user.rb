class User < ApplicationRecord
    has_many :production_products, class_name: "Product", foreign_key: :production_partner_id
    has_many :design_products, class_name: "Product",  foreign_key: :design_partner_id
    has_many :manufacture_products, class_name: "Product", foreign_key: :manufacture_partner_id
    belongs_to :company
    has_secure_password
    enum role: [:PRODUCTION_PARTNER, :DESIGN_PARTNER, :MANUFACTURE_PARTNER]
    validates :email, presence: true, uniqueness: true


end
