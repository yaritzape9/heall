class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :girl, foreign_key: true
      t.references :volunteer, foreign_key: true
      t.string :message
      t.boolean :volunteer_owner

      t.timestamps
    end
  end
end
