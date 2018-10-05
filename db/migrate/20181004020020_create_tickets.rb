class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :request_number, unique: true, null: false
      t.string :sequence_number
      t.string :request_type
      t.datetime :response_due_date_time
      t.json :primary_service_area_code
      t.json :additional_service_area_code
      t.text :well_known_text

      t.timestamps
    end
  end
end
