class Sample < ApplicationRecord
    belongs_to :product
    has_many :statuses
    delegate :production_partner, to: :product
    delegate :design_partner, to: :product
    delegate :manufacture_partner, to: :product 
    enum sample_type: [:PROTO, :FIT_SAMPLE, :PP, :TOP]

    validates :sample_type, presence: true

    accepts_nested_attributes_for :statuses

    def sample_current_status
        self.statuses.last
    end

end
