class Product < ApplicationRecord
    belongs_to :production_partner, class_name: "User", foreign_key: "production_partner_id"
    belongs_to :design_partner, class_name: "User", foreign_key: "design_partner_id"
    belongs_to :manufacture_partner, class_name: "User", foreign_key: "manufacture_partner_id"
    has_many :samples
    enum season: [:SUMMER2020, :FALL2020, :WINTER2020, :SUMMER2021]
    enum product_status: [:ACTIVE, :INACTIVE]
end
