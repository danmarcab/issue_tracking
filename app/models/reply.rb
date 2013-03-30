class Reply < ActiveRecord::Base
  attr_accessible :response, :ticket_id, :staff_id, :status_id

  belongs_to :ticket
  belongs_to :status
  belongs_to :staff
end
