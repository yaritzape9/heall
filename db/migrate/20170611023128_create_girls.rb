class CreateGirls < ActiveRecord::Migration[5.1]
  def change
    create_table :girls do |t|
      t.string :username
      t.string :language
      t.string :password_digest
      t.integer :age
      t.string :keyword

      t.timestamps
    end
  end
end
