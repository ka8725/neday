# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)1321269920noR5SG.jpg
require 'faker'
Rake::Task["db:schema:load"].execute

2.times { |i| Slide.create!(:title => Faker::Name.title, :description => Faker::Lorem.sentence, :file => File.new(File.join(Rails.root, "spec/images/slide#{i}.jpg"))) }

ContactType.create!(:name => 'Skype',             :icon => File.new(File.join(Rails.root, 'spec/images/skype.png')))
ContactType.create!(:name => 'Мобильный телефон', :icon => File.new(File.join(Rails.root, 'spec/images/mobile_phone.png')))
ContactType.create!(:name => 'Домашний телефон',  :icon => File.new(File.join(Rails.root, 'spec/images/phone.png')))
ContactType.create!(:name => 'ICQ',               :icon => File.new(File.join(Rails.root, 'spec/images/ICQ.png')))
ContactType.create!(:name => 'Jabber',            :icon => File.new(File.join(Rails.root, 'spec/images/jabber.png')))

hash_SummerSportName_PathToSportIcon = { 'Академическая гребля'        => 'spec/images/sport_icons/300px-Rowing_pictogram.svg.png',
                                         'Бадминтон'                   => 'spec/images/sport_icons/300px-Badminton_pictogram.svg.png',
					 'Баскетбол'                   => 'spec/images/sport_icons/300px-Basketball_pictogram.svg.png',
					 'Бокс'                        => 'spec/images/sport_icons/300px-Boxing_pictogram.svg.png',
                                         'Греко-римская борьба'        => 'spec/images/sport_icons/300px-Wrestling_pictogram.svg.png',
                                         'Вольная борьба'              => 'spec/images/sport_icons/300px-Wrestling_pictogram.svg.png',
                                         'Велоспорт'                   => 'spec/images/sport_icons/300px-Cycling_(road)_pictogram.svg.png',
                                         'Водное поло'                 => 'spec/images/sport_icons/300px-Water_polo_pictogram.svg.png',
 					 'Плавание'	              => 'spec/images/sport_icons/300px-Swimming_pictogram.svg.png',
                                         'Прыжки в воду'               => 'spec/images/sport_icons/300px-Diving_pictogram.svg.png',
                                         'Синхронное плавание'         => 'spec/images/sport_icons/300px-Synchronized_swimming_pictogram.svg.png',
                                         'Волейбол'                    => 'spec/images/sport_icons/300px-Volleyball_(indoor)_pictogram.svg.png',
                                         'Пляжный волейбол'            => 'spec/images/sport_icons/300px-Volleyball_(beach)_pictogram.svg.png',
                                         'Гандбол'                     => 'spec/images/sport_icons/300px-Handball_pictogram.svg.png',
                                         'Гольф'                       => 'spec/images/sport_icons/300px-Golf_pictogram.svg.png',
                                         'Гребля на байдарках и каноэ' => 'spec/images/sport_icons/300px-Canoeing_(flatwater)_pictogram.svg.png',
                                         'Гребной слалом'              => 'spec/images/sport_icons/300px-Canoeing_(slalom)_pictogram.svg.png',
                                         'Спортивная гимнастика'       => 'spec/images/sport_icons/300px-Gymnastics_(artistic)_pictogram.svg.png',
                                         'Художественная гимнастика'   => 'spec/images/sport_icons/300px-Gymnastics_(rhythmic)_pictogram.svg.png',
                                         'Прыжки на батуте'            => 'spec/images/sport_icons/300px-Gymnastics_(trampoline)_pictogram.svg.png',
                                         'Дзюдо'                       => 'spec/images/sport_icons/300px-Judo_pictogram.svg.png',
                                         'Конный спорт'                => 'spec/images/sport_icons/300px-Equestrian_pictogram.svg.png',
                                         'Лёгкая атлетика'             => 'spec/images/sport_icons/300px-Athletics_pictogram.svg.png',
                                         'Настольный теннис'           => 'spec/images/sport_icons/300px-Table_tennis_pictogram.svg.png',
                                         'Парусный спорт'              => 'spec/images/sport_icons/300px-Sailing_pictogram.svg.png',
                                         'Регби'                       => 'spec/images/sport_icons/300px-Rugby_union_pictogram.svg.png',
                                         'Современное пятиборье'       => 'spec/images/sport_icons/300px-Modern_pentathlon_pictogram.svg.png',
                                         'Стрельба'                    => 'spec/images/sport_icons/300px-Shooting_pictogram.svg.png',
                                         'Стрельба из лука'            => 'spec/images/sport_icons/300px-Archery_pictogram.svg.png',
                                         'Теннис'                      => 'spec/images/sport_icons/300px-Tennis_pictogram.svg.png',
                                         'Триатлон'                    => 'spec/images/sport_icons/300px-Triathlon_pictogram.svg.png',
                                         'Таэквондо'                   => 'spec/images/sport_icons/300px-Taekwondo_pictogram.svg.png',
                                         'Тяжёлая атлетика'            => 'spec/images/sport_icons/300px-Weightlifting_pictogram.svg.png',
                                         'Фехтование'                  => 'spec/images/sport_icons/300px-Fencing_pictogram.svg.png',
                                         'Футбол'                      => 'spec/images/sport_icons/300px-Football_pictogram.svg.png',
                                         'Хоккей на траве'             => 'spec/images/sport_icons/300px-Field_hockey_pictogram.svg.png' }

hash_WinterSportName_PathToSportIcon = { 'Биатлон'            => 'spec/images/sport_icons/600px-Biathlon_pictogram.svg.png',
                                         'Бобслей'            => 'spec/images/sport_icons/300px-Bobsleigh_pictogram.svg.png',
                                         'Скелетон'           => 'spec/images/sport_icons/300px-Skeleton_pictogram.svg.png',
                                         'Кёрлинг'            => 'spec/images/sport_icons/300px-Curling_pictogram.svg.png',
                                         'Конькобежный спорт' => 'spec/images/sport_icons/300px-Speed_skating_pictogram.svg.png',
                                         'Фигурное катание'   => 'spec/images/sport_icons/300px-Figure_skating_pictogram.svg.png',
                                         'Шорт-трек'          => 'spec/images/sport_icons/300px-Short_track_speed_skating_pictogram.svg.png',
                                         'Горнолыжный спорт'  => 'spec/images/sport_icons/600px-Alpine_skiing_pictogram.svg.png',
                                         'Прыжки с трамплина' => 'spec/images/sport_icons/300px-Ski_jumping_pictogram.svg.png',
                                         'Сноуборд'           => 'spec/images/sport_icons/300px-Snowboarding_pictogram.svg.png',
                                         'Фристайл'           => 'spec/images/sport_icons/300px-Freestyle_skiing_pictogram.svg.png',
                                         'Санный спорт'       => 'spec/images/sport_icons/300px-Luge_pictogram.svg.png',
                                         'Хоккей'             => 'spec/images/sport_icons/300px-Ice_hockey_pictogram.svg.png' }

hash_SummerSportName_PathToSportIcon.each_pair do |name, path|
    Sport.create!(:name => name, :icon => File.new(File.join(Rails.root, path)), :season => 'Летние виды спорта')
  end
hash_WinterSportName_PathToSportIcon.each_pair do |name, path|
    Sport.create!(:name => name, :icon => File.new(File.join(Rails.root, path)), :season => 'Зимние виды спорта')
  end

60.times { User.create! :first_name => Faker::Name.first_name,
                        :last_name => Faker::Name.last_name,
                        :email => Faker::Internet.email,
                        :password => 'password123',
                        :password_confirmation => 'password123',
                        :location => Location.new(:address => Faker::Address.street_address),
                        :sport_ids => Sport.all.map(&:id).shuffle[0...5] }
