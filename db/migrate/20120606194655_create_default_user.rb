class CreateDefaultUser < ActiveRecord::Migration
  def change
  	User.create(login: "admin", email: "admin@example.com", name: "Admin", password: "password")
  end
end
