class AddSeatsToSpaceships < ActiveRecord::Migration[7.0]
  def change
    add_column :spaceships, :seats, :integer
  end
end
