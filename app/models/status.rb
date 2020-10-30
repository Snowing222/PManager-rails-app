class Status < ApplicationRecord
    belongs_to :sample
    enum current_state: [:PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER, :PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER, :SAMPLE_REJECTED, :SAMPLE_APPROVED]

end
