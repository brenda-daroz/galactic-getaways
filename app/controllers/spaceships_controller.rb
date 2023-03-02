class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @spaceships = Spaceship.search_by_name_and_description(params[:query])
    else
      @spaceships = Spaceship.all
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
    params.require(:spaceship).permit(:speed, :seats, :power, :name, :description, :price, :photos [])
  end
end
