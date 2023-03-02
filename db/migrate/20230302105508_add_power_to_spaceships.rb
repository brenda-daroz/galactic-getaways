class AddPowerToSpaceships < ActiveRecord::Migration[7.0]
  def change
    add_column :spaceships, :power, :integer
  end
end
