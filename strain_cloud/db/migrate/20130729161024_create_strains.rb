class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :name
      t.integer :ID
      t.text :keywords

      t.timestamps
    end
  end
end
