class CreateSeismologyModels < ActiveRecord::Migration[7.1]
  def change
    create_table :seismology_models do |t|

      t.timestamps
    end
  end
end
