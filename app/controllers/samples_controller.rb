class SamplesController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        @sample = @product.samples.new
    end

    def create

    end

    def edit

    end

    def update

    end

    def show

    end
end
