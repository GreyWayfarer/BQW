class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :cadnumber, null: false

      t.timestamps
    end
  end
end
