class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.belongs_to :installation, index: true, null: false
      t.decimal :lat
      t.decimal :long
      t.timestamps
    end
  end
end
