class AddFrequencyColumn < ActiveRecord::Migration
  def change
  	add_column :keywords, :frequency, :integer
  end
end
