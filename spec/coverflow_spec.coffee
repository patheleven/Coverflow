global.$ = global.jQuery = require('jQuery')
require('../coverflow.coffee')

beforeEach ->
  this.addMatchers
    toBeReflected: ->
      this.message = ->
        "Expected images on the list to be reflected"
      false

describe 'path11 coverflow', ->
  it 'creates a reflection for the images', ->
    $('ul').coverflow()
    expect($('ul li img')).toBeReflected()
