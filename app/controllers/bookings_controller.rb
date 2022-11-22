class BookingsController < ApplicationController
  before_action :set_spa, only: ['new', 'create']

  # create a new booking shell to provide to the form
  def new
    @booking = Booking.new
    authorize @booking
  end

  # creation of the booking based on data submitted via the form
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.spa = @spa
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      redirect_to spa_path(@spa)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # sets the user that is currently logged in
  def set_spa
    @spa = Spa.find(params[:spa_id])
  end

  # strong params
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
