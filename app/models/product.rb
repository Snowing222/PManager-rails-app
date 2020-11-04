class Product < ApplicationRecord
    belongs_to :production_partner, class_name: "User", foreign_key: "production_partner_id"
    belongs_to :design_partner, class_name: "User", foreign_key: "design_partner_id"
    belongs_to :manufacture_partner, class_name: "User", foreign_key: "manufacture_partner_id"
    has_many :samples
    enum season: [:SUMMER2020, :FALL2020, :WINTER2020, :SUMMER2021]
    enum product_status: [:ACTIVE, :INACTIVE]

    def product_current_state
        self.product_current_sample.sample_current_status.current_state
    end

    def product_current_status
        self.product_current_sample.sample_current_status
    end

    def product_current_sample
        self.samples.last
    end

    def require_new_sample?
        product_current_status.SAMPLE_REJECTED? || (product_current_status.SAMPLE_APPROVED? && !product_current_sample.TOP?)
    end
end
