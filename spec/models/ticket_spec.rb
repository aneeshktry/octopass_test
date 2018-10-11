require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  before(:all) do
    @ticket = build(:ticket)
  end

  it "should validate with valid attribute" do
    expect(@ticket).to be_valid
  end

  

end
