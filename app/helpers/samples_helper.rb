module SamplesHelper

    def display_sample_owner(sample)
        if sample.sample_current_status.owner_id
            link_to User.find_by(id: @sample.sample_current_status.owner_id).name, User.find_by(id: @sample.sample_current_status.owner_id)
        end
    end
    
end
