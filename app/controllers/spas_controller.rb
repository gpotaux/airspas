class SpasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @spas = policy_scope(Spa)
    @spas = @spas.where("address ILIKE ?", "%#{params[:query]}%") if(params[:query].present?)
    @spas = @spas.where("category ILIKE ?", "%#{params[:category]}%") if(params[:category].present?)


    # a changer par @spas
    @markers = @spas.geocoded.map do |spa|
      {
        lat: spa.latitude,
        lng: spa.longitude,
        info_window: render_to_string(partial: "info_window", locals: {spa: spa}),
        image_url: helpers.asset_url("lotus.png")
      }
    end

    # if(params['query'].present?)
    #   @spas = policy_scope(Spa.where("address ILIKE ?", "%#{params[:query]}%"))
    # else
    #   # Ici, on vise l'ensemble des spa (Spa.all mais avec le pundit)
    # end

    # Array des 5 plus populaires mélangés pour affichage dans l'index :
    @spas_sorted = Spa.all.sort_by { |spa_to_sort| spa_to_sort.average_rating }.reverse.slice(0..4).sample(3).sort_by { |spa_to_sort| spa_to_sort.average_rating }.reverse
  end

  def show
    @spa = Spa.find(params[:id])
    @booking = Booking.new
    @bookings       = @spa.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
    authorize @spa
  end

  def new
    @spa = Spa.new
    authorize @spa
  end

  def create
    @spa = Spa.new(spa_params)
    @spa.user_id = current_user.id
    authorize @spa
    if @spa.save
      redirect_to spa_path(@spa)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spa = Spa.find(params[:id])
    authorize @spa
  end

  def update
    @spa = Spa.find(params[:id])
    authorize @spa
    if @spa.update(spa_params)
      redirect_to spa_path(@spa)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spa = Spa.find(params[:id])
    @spa.destroy
    authorize @spa
    redirect_to spas_path, status: :see_other
  end

  private

  def spa_params
    params.require(:spa).permit(:name, :address, :category, :price_per_hour, :photo)
  end
end
