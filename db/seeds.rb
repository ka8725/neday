# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)1321269920noR5SG.jpg
require 'faker'
Slide.destroy_all
2.times { |i| Slide.create!(:title => Faker::Name.title, :description => Faker::Lorem.sentence, :file => File.new(File.join(Rails.root, "spec/images/slide#{i}.jpg"))) }

UserContact.destroy_all

ContactType.destroy_all
ContactType.create!(:name => 'Skype', :icon => File.new(File.join(Rails.root, 'spec/images/skype.png')))
ContactType.create!(:name => 'Мобильный телефон', :icon => File.new(File.join(Rails.root, 'spec/images/mobile_phone.png')))
ContactType.create!(:name => 'Домашний телефон', :icon => File.new(File.join(Rails.root, 'spec/images/phone.png')))
ContactType.create!(:name => 'ICQ', :icon => File.new(File.join(Rails.root, 'spec/images/ICQ.png')))
ContactType.create!(:name => 'Jabber', :icon => File.new(File.join(Rails.root, 'spec/images/jabber.png')))

Sport.destroy_all
['Академическая гребля', 'Бадминтон', 'Баскетбол', 'Бокс', 'Греко-римская борьба', 'Вольная борьба', 'Велоспорт', 'Водное поло',
  'Плавание', 'Прыжки в воду', 'Синхронное плавание', 'Волейбол', 'Пляжный волейбол', 'Гандбол', 'Гольф', 'Гребля на байдарках и каноэ',
  'Гребной слалом', 'Спортивная гимнастика', 'Художественная гимнастика', 'Прыжки на батуте', 'Дзюдо', 'Конный спорт', 'Лёгкая атлетика',
  'Настольный теннис', 'Парусный спорт', 'Регби', 'Современное пятиборье', 'Стрельба', 'Стрельба из лука', 'Теннис', 'Триатлон', 'Тхэквондо',
  'Тяжёлая атлетика', 'Фехтование', 'Футбол', 'Хоккей на траве'].each do |i|
    Sport.create!(:name => i, :season => 'Летние виды спорта')
  end
['Биатлон', 'Бобслей', 'Скелетон', 'Кёрлинг', 'Конькобежный спорт', 'Фигурное катание', 'Шорт-трек', 'Горнолыжный спорт', 'Прыжки с трамплина',
  'Сноуборд', 'Фристайл', 'Санный спорт', 'Хоккей'].each do |i|
    Sport.create!(:name => i, :season => 'Зимние виды спорта')
  end
