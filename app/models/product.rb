class Product < ApplicationRecord
    belongs_to :production_partner, class_name: "User", foreign_key: "production_partner_id"
    belongs_to :design_partner, class_name: "User", foreign_key: "design_partner_id"
    belongs_to :manufacture_partner, class_name: "User", foreign_key: "manufacture_partner_id"
    has_many :samples

    enum season: [:SUMMER2020, :FALL2020, :WINTER2020, :SUMMER2021]
    enum product_status: [:ACTIVE, :INACTIVE]

    validates :style_number, presence:  { message: "must be given please" }
    validates :style_number, uniqueness: { scope: :season,
        message: "style number is existed in the season" }



    def product_current_state
        if !self.samples.empty?
            self.product_current_sample.sample_current_status.current_state
        else
            "N/A"
        end
    end

    def product_current_status
        if !self.samples.empty?
          self.product_current_sample.sample_current_status
        else
            "N/A"
        end
    end

    def product_current_sample
        if !self.samples.empty?
          self.samples.last
        else
            "N/A"
        end
    end

    def require_new_sample?
        self.samples.empty? || (!self.samples.empty? && (product_current_status.SAMPLE_REJECTED? )|| (product_current_status.SAMPLE_APPROVED? && !product_current_sample.TOP?))
    end

    def self.pending_manufacture
        self.all.select{|p|p.product_current_status.PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER?}     
    end

    def self.pending_design
        self.all.select{|p|p.product_current_status.PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER?}     
    end

end

