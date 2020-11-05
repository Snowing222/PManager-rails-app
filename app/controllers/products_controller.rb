class ProductsController < ApplicationController
    before_action :require_login

    def index
        if params[:query]=="ACTIVE" 
            @products = Product.ACTIVE

        elsif params[:query]=="INACTIVE"
            @products = Product.INACTIVE

        elsif params[:query]=="PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER"
            @products = Product.pending_manufacture

        elsif params[:query]=="PENDING_SAMPLE_REVIEW_FROM_DESIGN_PARTNER"
            @products = Product.pending_design
            
        else
            @products = Product.all
        end
    
    end

    def new
        @product = Product.new
        @product.production_partner = current_user
        @design_partners = User.DESIGN_PARTNER
        @manufacture_partners = User.MANUFACTURE_PARTNER
        @product.product_status = "INACTIVE"
     
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to @product
        else
            @product.production_partner = current_user
            @design_partners = User.DESIGN_PARTNER
            @manufacture_partners = User.MANUFACTURE_PARTNER
            @product.product_status = "INACTIVE"
            render 'new'
        end
    end

    def edit
        @product = Product.find_by(id: params[:id]) 
        @design_partners = User.DESIGN_PARTNER
        @manufacture_partners = User.MANUFACTURE_PARTNER
        @production_partners = User.PRODUCTION_PARTNER
    end

    def update
        @product = Product.find_by(id: params[:id])
        @product.update(product_params)

        if @product.save
            redirect_to @product
        else
            render 'edit'
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

    def q_params
        params.permit(:query)
    end
  
end
