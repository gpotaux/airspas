class SpasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @spas = policy_scope(Spa)
    # Ici, on vise l'ensemble des spa (Spa.all mais avec le pundit)
  end

  def show
    @spa = Spa.find(params[:id])
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
