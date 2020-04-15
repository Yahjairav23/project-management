class AddCreatedLocationToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :created_location, :string
  end
end
