class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @spaceships = Spaceship.all

    @markers = @spaceships.geocoded.map do |spaceship|
      {
        lat: spaceship.latitude,
        lng: spaceship.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {spaceship: spaceship}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @spaceship = Spaceship.new
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.save

  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :description, :price, :address, :photos [])
  end
end
