class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :plasmids, :plasmid, :name
  end
end
