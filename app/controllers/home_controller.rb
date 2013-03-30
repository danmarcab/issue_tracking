class HomeController < ApplicationController

  respond_to :html, :xml, :json

  layout "home"

  def index

  end

  def new_ticket

  end

  def create_ticket

    @ticket = Ticket.new(params[:ticket])

    if @ticket.save
      flash[:notice] = "Ticket created. You will receive a confirmation email in a moment."
      TicketMailer.ticket_created(@ticket).deliver
      redirect_to root_path
    else
      flash[:error] = "Ticket can't be created. Please fill all data."
      render :action => :new_ticket

    end

  end


  def ticket_history

    @ticket = Ticket.find_by_ref(params[:ref])

  end

end
