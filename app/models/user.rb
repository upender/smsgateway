class User < ActiveRecord::Base
  attr_accessible :name, :email, :mobile_number, :address, :city, :state
  validates :name, :email, :mobile_number, :address, :city, :state ,:presence => true
end
