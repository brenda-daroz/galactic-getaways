class AddSpeedToSpaceships < ActiveRecord::Migration[7.0]
  def change
    add_column :spaceships, :speed, :integer
  end
end
