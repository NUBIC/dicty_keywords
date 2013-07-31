class CreatePlasmids < ActiveRecord::Migration
  def change
    create_table :plasmids do |t|
      t.string :plasmid
      t.integer :ID
      t.text :keywords

      t.timestamps
    end
  end
end
