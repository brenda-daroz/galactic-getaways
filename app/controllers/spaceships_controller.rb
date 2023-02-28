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

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :price, :user, :description)
  end
end
