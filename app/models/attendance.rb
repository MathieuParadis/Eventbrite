class Attendance < ApplicationRecord
  after_create :report_admin

  belongs_to :guest, class_name: "User"
  belongs_to :event



  def report_admin
    AdminMailer.report_admin(self.event.admin).deliver_now
  end


end
