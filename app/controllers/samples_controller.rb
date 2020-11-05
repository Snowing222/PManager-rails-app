class SamplesController < ApplicationController
    before_action :require_login

    def new
        @product = Product.find(params[:product_id])
        @sample = @product.samples.new
        @sample.statuses.build
    end

    def create
        @sample = Sample.new(sample_params) 
        if @sample.save
            @sample.product.product_status ="ACTIVE"
            @sample.product.save
            @status = @sample.statuses.build
            redirect_to @sample
        else
            render 'samples/new'
        end
    end


    def update
     

    end

    def show
        @sample = Sample.find_by(id:params[:id])
        @statuses = @sample.statuses
    end
    
    private
    def sample_params
        params.require(:sample).permit(:sample_type, :comment, :product_id, statuses_attributes: [:current_state,:owner_id,:deadline])
    end
end
