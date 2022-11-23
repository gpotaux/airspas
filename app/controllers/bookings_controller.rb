class BookingsController < ApplicationController
  before_action :set_spa, only: ['new', 'create']

  def index
    @spas = policy_scope(Spa).where(user: current_user)
  end

  # Create a new booking shell to provide to the form
  # Booking dates are sent to flatpickr to block unavailable days
  def new
    @booking = Booking.new
    @bookings       = @spa.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
    authorize @booking
  end

  # Creation of the booking based on data submitted via the form
  # Start date and end date have been added manually due to flatpickr gem
  def create
    selected_dates = booking_params['start_date'].split(" to ")
    @booking = Booking.new
    @booking.user = current_user
    @booking.spa = @spa
    @booking.status = "pending"
    @booking.start_date = selected_dates[0]
    @booking.end_date = selected_dates[1]
    authorize @booking
    if @booking.save
      redirect_to spa_path(@spa)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Edit the booking to change its status
  def edit
    @booking = policy_scope(Booking).where(id: params['id'])
    raise
  end

  private

  # Sets the user that is currently logged in
  def set_spa
    @spa = Spa.find(params[:spa_id])
  end

  # Sstrong params
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
