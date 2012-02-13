# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)1321269920noR5SG.jpg
require 'faker'
require 'factory_girl_rails'
Slide.destroy_all
2.times { Factory(:slide) }
