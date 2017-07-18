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
    @unit = Unit.find(params[:unit_id])
    @inquiry = Unit.find(params[:unit_id]).inquiries.create(inquiry_params)

    if @inquiry.valid?
      flash[:success] = "Inquiry created successfully"
      redirect_to unit_path(@unit.id)
    else
      flash[:error] = @inquiry.errors.full_messages.join(". ")
      redirect_to :back
    end

  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:rental_site, :phone_number, :email, :first_name, :last_name, :arrival_date, :departure_date, :unit_id)
  end

end
