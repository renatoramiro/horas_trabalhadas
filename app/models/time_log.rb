class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_type

  attr_accessible :description, :task_date, :worked_hours, :user_id, :task_type_id

  validates :task_date, :presence => true
  validates :worked_hours, :presence => true
end
