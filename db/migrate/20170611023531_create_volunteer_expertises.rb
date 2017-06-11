class CreateVolunteerExpertises < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteer_expertises do |t|
      t.references :volunteer, foreign_key: true
      t.references :expertise, foreign_key: true

      t.timestamps
    end
  end
end
