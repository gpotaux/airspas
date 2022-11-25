class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @spas_last = Spa.last(6)
  end
end
