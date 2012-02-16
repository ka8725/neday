class YandexMap
  constructor: (@key, container = '.yandex-map') ->
    @container = $(container)
    loadSrc()

  loadSrc: ->
    if @container.length
      scr = document.createElement('script')
      src.type = 'text/javascript'
      src.src = "http://api-maps.yandex.ru/1.1/index.xml?key=#{@key}"
      src.onload = initMap()
      @$('body').append(script)

  initMap: ->
    @map = new YMaps.Map(@container[0])
