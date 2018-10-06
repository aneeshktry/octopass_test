class Ticket < ApplicationRecord
    
    validates :request_number, presence: true, uniqueness: true
    validates :sequence_number, presence: true 
    validates :request_type, presence: true 
    validates :response_due_date_time, presence: true 
    validates :primary_service_area_code, presence: true 
    validates :additional_service_area_code, presence: true 
    validates :well_known_text, presence: true 

    has_one :excavator, dependent: :destroy
end
