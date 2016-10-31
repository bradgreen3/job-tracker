class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.create(contact_params)
    if @contact.save
      flash[:success] = "You created #{@contact.full_name}"
      redirect_to company_jobs_path(@company)
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end

end
