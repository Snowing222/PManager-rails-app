class Product < ApplicationRecord
    belongs_to :production_partner, class_name: "User", foreign_key: "production_partner_id"
    belongs_to :design_partner, class_name: "User", foreign_key: "design_partner_id"
    belongs_to :manufacture_partner, class_name: "User", foreign_key: "manufacture_partner_id"
    
    belongs_to :factory, class_name: "Company", foreign_key:"factory_id"
    
    has_many :samples, :dependent => :destroy
 

    enum season: [:SUMMER2020, :FALL2020, :WINTER2020, :SUMMER2021]
    enum product_status: [:ACTIVE, :INACTIVE]

    validates :style_number, presence:  { message: "must be given please" }
    validates :style_number, uniqueness: { scope: :season,
        message: "style number is existed in the season" }

    def product_current_sample 
        self.samples.last if !self.samples.empty?
    end

    def product_current_status
        self.samples.last.statuses.last if !self.samples.empty?
    end


    def product_current_state
        self.samples.last.statuses.last.current_state if !self.samples.empty?  
    end

    def require_new_sample?
        self.samples.empty? || (!self.samples.empty? && (product_current_status.SAMPLE_REJECTED? || product_current_status.SAMPLE_APPROVED?))
    end

    def self.pending_manufacture
        self.ACTIVE.select{|p|p.product_current_status.PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER? if !p.samples.empty?}     
    end

    def self.pending_design
        self.ACTIVE.select{|p|p.product_current_status.PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER? if !p.samples.empty?}     
    end

end

