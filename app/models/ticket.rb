class Ticket < ActiveRecord::Base

  #has_secure_password

  belongs_to :user

  #validates_format_of :eta, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy"

  def estimated_time
    eta.strftime("%m/%d/%Y")
  end
end
