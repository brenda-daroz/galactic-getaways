class SpaceshipsController < ApplicationController

  def index
    @spaceships = Spaceship.all
  end

  def new
    @spaceship = Spaceship.new
  end
end
