fs      = require('fs')
expect  = require('chai').expect
jsdom   = require('jsdom').jsdom
html    = fs.readFileSync("#{__dirname}/index.html", 'utf-8')

global.document  = jsdom(html)
global.window    = document.parentWindow
global.jQuery    = $ = require('jquery')
require('../dist/jquery.serializeJSON.js')

data =
  phone: '555.111.2222'
  website: 'http://www.example.com'
  user:
    name: 'Zombie Pirate'
    username: 'zombie'
    email: 'zombie@example.com'
  address:
    street:
      num: '123'
      name: 'Post St.'
    state: 'NY'
    city: 'New York'
    zip: '12345'
  '15b': ['tivs', 'ctide', 'billionaire']
  about:
    plugin: 'Converts form to JSON'
  is_user: true
  has_car: 'audi'
  shoe:
    type: 'sneaker'

describe 'Serialize Form to JSON', ->

  it 'should serialize a form to a correct JSON object', ->
    json = $('form').serializeJSON()
    expect(json).to.deep.equal(data)
