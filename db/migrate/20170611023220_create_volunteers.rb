class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :username
      t.string :language
      t.attachment :certification
      t.string :password_digest

      t.timestamps
    end
  end
end
