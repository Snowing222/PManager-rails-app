module SamplesHelper

    def display_sample_owner(sample)
        if sample.sample_current_status.owner_id
            link_to User.find_by(id: @sample.sample_current_status.owner_id).name, User.find_by(id: @sample.sample_current_status.owner_id)
        end
    end

    def display_next_action_button(sample)
        if sample.sample_current_status.PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER?
            form_for Status.new do |f|
                concat f.hidden_field :current_state, :value => "PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER"
                concat f.hidden_field :sample_id, :value =>@sample.id
                concat f.hidden_field :owner_id, :value => @sample.product.design_partner.id
                concat f.submit "SMPL RECEIVED" 
            end

        elsif sample.sample_current_status.PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER?
            form_for Status.new do |f|
              concat f.label :sample_status
              concat f.select :current_state, Status.current_states.keys.slice(2,4)
              concat f.hidden_field :sample_id, :value =>@sample.id
              concat f.submit "UPDATE SAMPLE STATUS"
            end
        
        elsif sample.product.require_new_sample?
            link_to 'REQUEST A NEW SAMPLE', new_product_sample_path(@sample.product) 
        end
    end

    
end



