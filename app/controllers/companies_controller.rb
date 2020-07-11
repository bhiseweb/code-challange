class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      set_alert
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      set_alert
      render :edit
    end
  end

  def destroy
    if @company.destroy
      flash.notice = 'Company destroyed!!!'
    else
      set_alert
    end
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def set_alert
    flash.alert = @company.errors.full_messages.join(', ')
  end
end
