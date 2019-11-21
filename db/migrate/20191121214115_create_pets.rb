class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.string :approximate_age
      t.string :description
      t.boolean :adoptable

      t.timestamps
    end
  end
end
