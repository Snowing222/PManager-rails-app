class Status < ApplicationRecord
    belongs_to :sample
    validates :current_state, presence: true
    
    enum current_state: [:PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER, :PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER, :SAMPLE_REJECTED, :SAMPLE_APPROVED]
     
    def set_product_status
        if  self.SAMPLE_APPROVED? && self.sample.TOP?
            self.sample.product.product_status = "INACTIVE"
            self.sample.product.save
        end
    end
end