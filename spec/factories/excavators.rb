FactoryBot.define do
  
    factory :excavator do
      association :ticket, strategy: :build
      company_name { "John Doe CONSTRUCTION" }
      address { {"Address"=>"555 Some RD", "City"=>"SOME PARK", "State"=>"ZZ", "Zip"=>"55555"} }
      crew_onsite { true }
    end

  end