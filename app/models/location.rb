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

  def show_map(options = {})
    options.reverse_merge!({:layer => "map", :zoom => 15, :size => '250,250', :lang => 'ru-Ru'})
    "http://static-maps.yandex.ru/1.x/?key=#{Settings.yandex.api_key}&l=#{options[:layer]}&ll=#{longitude},#{latitude}&z=#{options[:zoom]}&size=#{options[:size]}&pt=#{longitude},#{latitude}"
  end

  private
  def translated_address
    return unless address
    "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя".split('').any? {|letter| address.include?(letter) } ?
      address : Google::Translator.new.translate('', 'ru', address)
  end
end
