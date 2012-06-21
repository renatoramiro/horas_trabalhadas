class TaskType < ActiveRecord::Base
  belongs_to :project
  has_many :time_logs
  validates_associated :project

  attr_accessible :name, :project_id

  validates :name, :uniqueness => true, :presence => true, :length => { :in => 5..50 }

  def to_param
  	"#{id}-#{name}".parameterize
  end
end
