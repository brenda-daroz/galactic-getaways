class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @spaceships = Spaceship.all
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @spaceships = Spaceship.where(sql_query, query: "%#{params[:query]}%")
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
    params.require(:spaceship).permit(:name, :description, :price, :photos [])
  end
end
