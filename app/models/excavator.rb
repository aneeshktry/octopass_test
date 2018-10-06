class Excavator < ApplicationRecord
    validates :company_name, presence: true 
    validates :address, presence: true 
    validates :crew_onsite, presence: true 

    belongs_to :ticket
end
