class DashboardsController < ApplicationController

  def index
    @spas = policy_scope(Spa).where(user: current_user)
    @bookings = current_user.bookings_as_owner.order("id ASC")
  end

  # Edit the booking to change its status
  def edit
    @booking = Booking.find(params['id'])
    authorize @booking
    if @booking.update(status: params['status'])
      redirect_to dashboards_path
    else
      render "/dashboards", status: :unprocessable_entity
    end
  end
end
