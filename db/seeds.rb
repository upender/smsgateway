# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# User ####################

#t.string :name ,t.string :email, t.string :mobile_number,t.text :address,t.string :city,t.string :state

#Vinod 9963444005
# Suprit 9704231557
User.create(:name=>'Suprit',:email=>'suprit@indigenius.com',:mobile_number=>'9704231557',:address=>'Jubilee Hills',:city=>'Hyderabad',:state=>'Andhra Pradesh')
User.create(:name=>'Vinod',:email=>'Vinod@indigenius.com',:mobile_number=>'9963444005',:address=>'RTC X roads',:city=>'Hyderabad',:state=>'Andhra Pradesh')

