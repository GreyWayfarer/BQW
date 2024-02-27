class AddJsonDataToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :json_data, :text
  end
end
