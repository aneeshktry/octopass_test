class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|
      t.belongs_to :ticket, index: true
      t.string :company_name
      t.json :address
      t.boolean :crew_onsite
      t.timestamps
    end
  end
end
