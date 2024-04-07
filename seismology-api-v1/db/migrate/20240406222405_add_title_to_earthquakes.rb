class AddTitleToEarthquakes < ActiveRecord::Migration[7.1]
  def change
    add_column :earthquakes, :title, :string
  end
end
