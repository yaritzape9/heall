class CreateGirlExpertises < ActiveRecord::Migration[5.1]
  def change
    create_table :girl_expertises do |t|
      t.references :girl, foreign_key: true
      t.references :expertise, foreign_key: true

      t.timestamps
    end
  end
end
