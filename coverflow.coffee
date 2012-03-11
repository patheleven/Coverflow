$.fn.coverflow = ->
  newImageSelected = ->
    if $(this).hasClass('right')
      $('.current').removeClass('current').addClass('left')
      $(this).removeClass('right').addClass('current')
      $(this).prevAll().removeClass('right').addClass('left')
    else
      $('.current').removeClass('current').addClass('right')
      $(this).removeClass('left').addClass('current')
      $(this).nextAll().removeClass('left').addClass('right')
    setZIndex()

  setZIndex = =>
    index = 100
    this.find('li').css('z-index', index)
    this.find('li.current').css('z-index', index+1)
    for right in $('li.right')
      $(right).css('z-index', index)
      index--

  addReflections = =>
    addReflection($(img)) for img in this.find('li img')

  addReflection = (image) ->
    width_and_height = "width:#{image.width()}px;height:160px;"
    image.parent().append("<div class='reflection' style='background-image:url(#{image.attr('src')});#{width_and_height}'/>")
    image.parent().find('.reflection').append("<div class='overlay'style='#{width_and_height}'/>")
    image.addClass('image')

  prepareElements = =>
    this.find('li').addClass('right').first().addClass('current').removeClass('right')

  this.find('li').click(newImageSelected)
  addReflections()
  prepareElements()
  setZIndex()

