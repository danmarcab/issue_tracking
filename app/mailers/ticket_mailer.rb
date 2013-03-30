class TicketMailer < ActionMailer::Base
  default from: "issues@issue-tracker.com"

  def ticket_created(ticket)
    @ticket = ticket
    mail(:to => ticket.customer_email, :subject => "Your issue has been registered")
  end

  def ticket_updated(ticket, reply)
    @ticket = ticket
    @reply = reply
    mail(:to => ticket.customer_email, :subject => "Your issue has been updated")
  end

end
