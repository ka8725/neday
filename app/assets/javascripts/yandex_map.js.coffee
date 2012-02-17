class YandexMap
  constructor: (@key, @zoom = 12, container = 'yandex-map') ->
    @container = document.getElementsByClassName(container)[0]
    @container = document.getElementsByTagName(container)[0] unless @container
    @container = document.getElementById(container) unless @container
    throw 'ElementNotFound' unless @container
    @initMap()

  initMap: =>
    @map = new YMaps.Map(@container)
    @setZoom(@zoom)
    showYandexMapLocation = (error = nil) ->
      if YMaps.location
        @setCenter(YMaps.location)
        @setMyCurrentLocation(YMaps.location)
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(
        (pos) ->
          location = pos.coords
          location.title = 'Я здесь'
          @setMyCurrentLocation(location)
        (error) ->
          showYandexMapLocation(error)
      )
    else
      showYandexMapLocation()


  setMyCurrentLocation: (location) ->
    location.title = 'Я здесь'
    @addPointToMap(location, "default#redSmallPoint")

  setCenter: (location) ->
    @map.setCenter(@getGeoPoint(location), @zoom)

  setZoom: (zoom = 10) ->
    @map.setZoom(zoom)

  addPointToMap: (location, style = 'default#lightblueSmallPoint') ->
    @map.addOverlay(@getPlacemark(location, style))

  getGeoPoint: (location) ->
    new YMaps.GeoPoint(location.longitude, location.latitude)

  getPlacemark: (location, style) ->
    placemark = new YMaps.Placemark(@getGeoPoint(location), {style : style, draggable : false, balloonOptions : {mapAutoPan : false}})
    placemark.name = location.title
    placemark.description = location.description
    placemark

window.YandexMap = YandexMap
