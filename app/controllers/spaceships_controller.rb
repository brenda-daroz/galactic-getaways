class SpaceshipsController < ApplicationController

  def index
    @spaceships = Spaceship.all
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
