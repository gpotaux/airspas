class SpasController < ApplicationController
  def index
    @spas = Spa.all
  end

  def show
    @spa = Spa.find(params[:id])
  end

  def new
    @spa = Spa.new
  end

  def create
    @spa = Spa.new(spa_params)
    @spa.user_id = current_user.id
    if @spa.save
      redirect_to spa_path(@spa)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spa = Spa.find(params[:id])
  end

  def update
    @spa = Spa.find(params[:id])
    if @spa.update(spa_params)
      redirect_to spa_path(@spa)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spa = Spa.find(params[:id])
    @spa.destroy
    redirect_to spas_path, status: :see_other
  end

  private

  def spa_params
    params.require(:spa).permit(:name, :address, :category, :price_per_hour)
  end
end
