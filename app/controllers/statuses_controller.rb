class StatusesController < ApplicationController
    before_action :require_login

    def create
     
        @status = Status.new(status_params)
        if @status.save
            @status.set_product_status
            redirect_to @status.sample
        end
    end

    private 
    def status_params
        params.require(:status).permit(:current_state, :sample_id, :owner_id)
    end
end
