class CompaniesController < ApplicationController
  
  def index
    @companies = Company.list_aplha.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
    @company = Company.find_by_id(params[:id])
    @company.destroy
    redirect_to companies_path
  end

end
