require 'rails_helper'

RSpec.describe Excavator, type: :model do
  
  it "should validate with valid attributes" do
    excavator = build(:excavator)
    expect(excavator).to be_valid
  end

  it "shuld not save without a ticket" do
    excavator = build(:excavator , :ticket => nil)
    expect(excavator).not_to be_valid
    expect(excavator.errors[:ticket].count).to eq(1)
  end
  
end
