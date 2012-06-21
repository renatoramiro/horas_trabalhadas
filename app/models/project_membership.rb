class ProjectMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :joined, :leaved, :project_id, :user_id

  validates_associated :user
  validates_associated :project

  validates :joined, :presence => true
end
