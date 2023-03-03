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

    if params[:query].present?
      @spaceships = Spaceship.search_by_name_and_description(params[:query])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @markers = {
        lat: @spaceship.geocode[0],
        lng: @spaceship.geocode[1],
        info_window_html: render_to_string(partial: "info_window", locals: {spaceship: @spaceship}),
        marker_html: render_to_string(partial: "marker")
      }

  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spaceship_params
    params
    .require(:spaceship)
    .permit(:address, :speed, :seats, :power, :name, :description, :price, photos: [])
  end
end
