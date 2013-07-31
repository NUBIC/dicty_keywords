class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :word
      t.text :plasmids

      t.timestamps
    end
  end
end
