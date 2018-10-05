FactoryBot.define do
  
    factory :ticket do
      request_number { "09252012-00001" }
      sequence_number { "2421" }
      request_type { "Normal" }
    end
  end