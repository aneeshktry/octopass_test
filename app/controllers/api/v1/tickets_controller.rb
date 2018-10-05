class Api::V1::TicketsController < ApplicationController
  before_action :set_default_format
  before_action :check_mandatory_data, :only => :create

  def create
    response = { status: "success"}
    @ticket = Ticket.new
    @ticket.request_number = params["RequestNumber"]
    @ticket.sequence_number = params["SequenceNumber"]
    @ticket.request_type = params["RequestType"]
    @ticket.response_due_date_time = params["DateTimes"]["ResponseDueDateTime"]
    @ticket.primary_service_area_code = params["ServiceArea"]["PrimaryServiceAreaCode"]
    @ticket.additional_service_area_code = params["ServiceArea"]["AdditionalServiceAreaCodes"]
    @ticket.well_known_text = params["ExcavationInfo"]["DigsiteInfo"]["WellKnownText"]
    @ticket.valid?
    if @ticket.valid?
        @ticket.save
        @excavator = Excavator.new
        @excavator.ticket = @ticket
        @excavator.company_name = params["Excavator"]["CompanyName"]
        @excavator.address = get_address(params["Excavator"])
        @excavator.crew_onsite = params["Excavator"]["CrewOnsite"] == "true" ? true : false
        @excavator.save
        response[:message] = "Successfully created ticket and excavator"
    else
        response[:status] = "Error"
        response[:message] = @ticket.errors.full_messages
    end
    render :json => response
  end


  private

  def set_default_format
    request.format = :json
  end

  def check_mandatory_data
    
    errors = {}
    %w{RequestNumber SequenceNumber RequestType DateTimes ServiceArea Excavator}.each do |key|
      errors[key] = "can't be blank" if params[key].blank?

    end

    render :json => {:status => "error", :errors => errors} unless errors.blank?

  end

  def get_address excavator
    {"Address": excavator["Address"], "City": excavator["City"], "State": excavator["State"], "Zip": excavator["Zip"]}
  end
end
