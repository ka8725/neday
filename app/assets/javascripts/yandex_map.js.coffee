class YandexMap
  constructor: (@key, @zoom = 10, container = 'yandex-map') ->
    @container = document.getElementsByClassName(container)[0]
    @container = document.getElementsByTagName(container)[0] unless @container
    @container = document.getElementById(container) unless @container
    throw 'ElementNotFound' unless @container
    @initMap()

  initMap: =>
    @map = new YMaps.Map(@container)
    @setZoom(@zoom)
    showYandexMapLocation = (error = null) =>
      if YMaps.location
        @setMyCurrentLocation(YMaps.location, 'Мое текущее место положения')
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(
        (pos) =>
          @setMyCurrentLocation(pos.coords, 'Мое текущее место положения')
        (error) =>
          showYandexMapLocation(error)
      )
    else
      showYandexMapLocation()


  setMyCurrentLocation: (location, message = 'Я здесь') ->
    location.title = message
    @addPointToMap(location, "default#redSmallPoint")

  setCenter: (location) ->
    @isCenterSet = true
    @map.setCenter(@getGeoPoint(location), @zoom)

  setZoom: (zoom = 10) ->
    @map.setZoom(zoom)

  addPointToMap: (location, style = 'default#lightblueSmallPoint') ->
    @map.addOverlay(@getPlacemark(location, style))
    @setCenter(location) unless @isCenterSet

  getGeoPoint: (location) ->
    new YMaps.GeoPoint(location.longitude, location.latitude)

  getPlacemark: (location, style) ->
    placemark = new YMaps.Placemark(@getGeoPoint(location), {style : style, draggable : false, balloonOptions : {mapAutoPan : false}})
    placemark.name = location.title
    placemark.description = location.description
    placemark

window.YandexMap = YandexMap
