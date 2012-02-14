changeCurrent = ->
  if $(this).hasClass('right')
    $('.current').removeClass('current').addClass('left')
    $(this).removeClass('right').addClass('current')
    $(this).prevAll().removeClass('right').addClass('left')
  else
    $('.current').removeClass('current').addClass('right')
    $(this).removeClass('left').addClass('current')
    $(this).nextAll().removeClass('left').addClass('right')
  setZIndex()

setZIndex = ->
  index = 100
  $('li').css('z-index', index)
  $('li.current').css('z-index', index+1)
  for right in $('li.right')
    $(right).css('z-index', index)
    index--

addReflections = ->
  for img in $('li img')
    $(img).parent().append("<div class='reflection'>#{$(img).parent().html()}<div class='overlay'/></div>")
    $(img).addClass('image')

$(document).ready ->
  $('li').click(changeCurrent)
  addReflections()
  setZIndex()

