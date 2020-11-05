module ProductsHelper
    def set_current_sample_status(p)
        if !p.samples.empty?
            link_to p.product_current_sample.sample_type, p.product_current_sample
        else
            "NA"
        end
    end

    def next_action(p)
        if p.require_new_sample?
            link_to 'REQUEST A NEW SAMPLE', new_product_sample_path(p)

        elsif !p.samples.empty? && p.product_current_status.PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER?
            form_for p.product_current_sample.statuses.build do |f|

                f.hidden_field :current_state, :value => "PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER"
                f.hidden_field :sample_id
                f.hidden_field :owner_id, :value => p.design_partner.id
                f.submit "SMPL RECEIVED"
            end
        
        elsif !p.samples.empty? && p.product_current_status.PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER?
            form_for p.product_current_sample.statuses.build do |f|
                f.select :current_state, Status.current_states.keys.slice(2,4)
                f.hidden_field :sample_id
                f.submit "UPDATE SAMPLE STATUS"
            end

        end

    end

         
end
