class Ticket < ActiveRecord::Base
  attr_accessible :body, :customer_email, :customer_name, :ref, :subject, :department_id

  belongs_to :department
  belongs_to :staff
  belongs_to :status

  has_many :replies

  after_create :assign_unique_ref
  before_create :set_initial_status

  def assign_unique_ref
    self.ref = "REQ-#{"%06d" % self.id}"

    self.save
  end

  def set_initial_status

    self.status_id = Status.find(:first, :conditions => {:code => "WFSR"}).id

  end

end
