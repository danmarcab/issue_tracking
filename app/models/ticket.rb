class Ticket < ActiveRecord::Base
  attr_accessible :body, :customer_email, :customer_name, :ref, :subject
end
