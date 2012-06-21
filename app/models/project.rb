class Project < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :task_types
  has_many :time_logs, :through => :task_types

  has_many :project_memberships
  has_many :users, :through => :project_memberships

  validates :name, :presence => true, :uniqueness => true, :length => { :in => 5..50 }
  
end
