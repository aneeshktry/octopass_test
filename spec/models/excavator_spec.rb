require 'rails_helper'

RSpec.describe Excavator, type: :model do
  before(:all) do
    @excavator = build(:excavator)
  end
  it "should validate with valid attribute" do
    expect(@excavator).to be_valid
  end
  
end
