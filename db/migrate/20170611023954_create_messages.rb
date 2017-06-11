class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :girl, foreign_key: true
      t.references :volunteer, foreign_key: true
      t.string :message
      t.integer :speaker

      t.timestamps
    end
  end
end
