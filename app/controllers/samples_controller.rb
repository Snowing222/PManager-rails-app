class SamplesController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        @sample = @product.samples.new
     
    end

    def create
        raise params.inspect

    end

    def edit

    end

    def update

    end

    def show

    end
end
