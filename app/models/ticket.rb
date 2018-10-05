class Ticket < ApplicationRecord
    validates :request_number, presence: true 
    validates :sequence_number, presence: true 
    validates :request_type, presence: true 

    has_one :excavator, dependent: :destroy
end
