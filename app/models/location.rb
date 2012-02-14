# -*- encoding : utf-8 -*-
require 'google_translate'

class Location < ActiveRecord::Base
  attr_accessible :address
  geocoded_by :translated_address do |obj, results|
    if geo = results.first
      %w(city country latitude longitude address).each { |f| obj.send("#{f}=", geo.send(f)) }
    end
  end
  after_validation :geocode
  belongs_to :locationable, :polymorphic => true
  delegate :name, :to => :locationable, :allow_nil => true

  private
  # Some social networks give translited addresses. So we have to translate them to Russian to get full andress for Yandex.
  # Note: Yandex works correctly only for addresses on Russian language
  def translated_address
    return unless address
    "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя".split('').any? {|letter| address.include?(letter) } ?
      address : Google::Translator.new.translate('', 'ru', address)
  end
end
