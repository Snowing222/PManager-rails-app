class ProductsController < ApplicationController
    before_action :require_login

    def new
        @product = Product.new
        @product.production_partner = current_user
        @design_partners = User.DESIGN_PARTNER
        @manufacture_partners = User.PRODUCTION_PARTNER
        @product.product_status = "INACTIVE"
     
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to @product
        else
            render 'new'
        end
    end

    def show
        @product = Product.find_by(id: params[:id])
        @user = current_user
    end

    private
    
    def product_params
        params.require(:product).permit(:season, :style_number, :image_url, :deadline, :description, :design_partner_id, :manufacture_partner_id, :production_partner_id, :product_status, :created_at, :updated_at)
    end
  
end
