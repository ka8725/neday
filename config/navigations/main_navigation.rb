# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.autogenerate_item_ids = false
  navigation.items do |primary|
    primary.item :home, t('navbar.home'), root_path
    primary.item :events, t('navbar.events'), events_path
    primary.item :opponents, t('navbar.opponents'), users_path
    primary.item :places, t('navbar.places'), places_path
#    primary.item :teams, t('navbar.teams'), ''
#    primary.item :tournaments, t('navbar.tournaments'), ''
    primary.dom_class = 'nav'
  end
end
