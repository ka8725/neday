# -*- encoding : utf-8 -*-
class Location < ActiveRecord::Base
  attr_accessible :address
  geocoded_by :address do |obj, results|
    if geo = results.first
      %w(city country latitude longitude address).each { |f| obj.send("#{f}=", geo.send(f)) }
    end
  end
  after_validation :geocode
  belongs_to :locationable, :polymorphic => true
  delegate :name, :to => :locationable, :allow_nil => true
end
