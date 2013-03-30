class ManagementController < ApplicationController

  layout "management"

  def unassigned
    @tickets = Ticket.find(:all, :conditions => {:staff_id => nil} )
    @title = "Unassigned tickets"
    render :list
  end

  def opened
    @tickets = Ticket.find(:all, :joins => :status, :conditions => {:statuses => {:category => "Open"}})
    @title = "Opened tickets"
    render :list
  end

  def on_hold
    @tickets = Ticket.find(:all, :joins => :status, :conditions => {:statuses => {:category => "Hold"}})
    @title = "On hold tickets"
    render :list
  end

  def closed
    @tickets = Ticket.find(:all, :joins => :status, :conditions => {:statuses => {:category => "Closed"}})
    @title = "Closed tickets"
    render :list
  end

  def view_ticket

    @ticket = Ticket.find(params[:id])

    if @ticket.staff.blank?
      @ticket.staff = current_staff
      @ticket.save
    end

  end

  def reply_ticket

    reply = Reply.create(params[:reply])

    reply.ticket.status = reply.status

    reply.ticket.save

    TicketMailer.ticket_updated(reply.ticket, reply).deliver

    redirect_to :action => :view_ticket, :id => params[:reply][:ticket_id]

  end

  def search_tickets
    search_str = "%#{params[:search][:string]}%"

    @tickets = Ticket.find(:all, :conditions =>["ref like ? or subject like ?", search_str, search_str])
    @title = "Search tickets with #{params[:search][:string]}"
    render :list
  end

end
