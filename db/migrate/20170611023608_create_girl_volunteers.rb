class CreateGirlVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :girl_volunteers do |t|
      t.references :volunteer, foreign_key: true
      t.references :girl, foreign_key: true

      t.timestamps
    end
  end
end
