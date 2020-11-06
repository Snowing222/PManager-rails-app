class CompaniesController < ApplicationController
    before_action :require_login
    def show
        @company = Company.find(params[:id])
        @users = @company.users
    end
end
