class CreateInstallations < ActiveRecord::Migration[5.1]
  def change
    create_table :installations do |t|
      t.string :configuration_name 
      t.decimal :tilt_angle
      t.decimal :orientation_angle
      t.timestamps
    end
  end
end
