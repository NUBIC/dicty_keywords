class FixColumnName < ActiveRecord::Migration
  def change
      rename_column :keywords, :name, :word
  end
end
