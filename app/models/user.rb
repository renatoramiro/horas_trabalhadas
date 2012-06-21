class User < ActiveRecord::Base
  attr_accessible :login, :email, :name, :password

  has_many :project_memberships
  has_many :projects, :through => :project_memberships
  has_many :time_logs

  validates :login, :presence => true, :length => { :in => 5..100 }, :uniqueness => true
  validates :password, :length => { :in => 5..100 }, :presence => true
  validates :name, :presence => true
  validates :email, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  def self.logon(username_or_email, password)
  	where("(login = ? OR email = ?) AND password = ?", username_or_email, username_or_email, password).first
  end  
end
