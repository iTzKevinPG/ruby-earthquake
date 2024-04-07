class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.decimal :mag
      t.string :place
      t.bigint :time
      t.bigint :updated
      t.integer :tz
      t.string :url
      t.string :detail
      t.integer :felt
      t.decimal :cdi
      t.decimal :mmi
      t.string :alert
      t.string :status
      t.integer :tsunami
      t.integer :sig
      t.string :net
      t.string :code
      t.string :ids
      t.string :sources
      t.string :types
      t.integer :nst
      t.decimal :dmin
      t.decimal :rms
      t.decimal :gap
      t.string :magType
      t.string :eq_type
      t.string :eq_id
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :depth

      t.timestamps
    end
  end
end
