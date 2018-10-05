class TicketsController < ApplicationController
    def index
        @tickets = Ticket.all
    end

    def show
        @ticket = Ticket.includes(:excavator).find(params[:id])
        @excavator = @ticket.excavator
        @mapdata = get_map_data(@ticket.well_known_text)
    end

    private 

    def get_map_data data
        return data.split('(').last.split(')').first.split(',').map{ |latlong| latlong.split(" ") }
    end
end
