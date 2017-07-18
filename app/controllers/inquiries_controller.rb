class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def show
    @unit = Unit.find(params[:unit_id])
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @unit = Unit.find(params[:unit_id])
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Unit.find(params[:unit_id]).inquiries.create(inquiry_params)

    if @inquiry.valid?
      redirect_to root_path
    else
      redirect_to :back
    end

  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:rental_site, :phone_number, :email, :first_name, :last_name, :arrival_date, :departure_date, :unit_id)
  end

end
