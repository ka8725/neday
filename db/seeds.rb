# encoding: utf-8

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

ContactType.destroy_all
ContactType.create!(:name => 'Skype', :icon => File.new(File.join(Rails.root, 'spec/images/skype.png')))
ContactType.create!(:name => 'Мобильный телефон', :icon => File.new(File.join(Rails.root, 'spec/images/mobile_phone.png')))
ContactType.create!(:name => 'Домашний телефон', :icon => File.new(File.join(Rails.root, 'spec/images/phone.png')))
ContactType.create!(:name => 'ICQ', :icon => File.new(File.join(Rails.root, 'spec/images/ICQ.png')))
ContactType.create!(:name => 'Jabber', :icon => File.new(File.join(Rails.root, 'spec/images/jabber.png')))
