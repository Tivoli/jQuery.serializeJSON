fs        = require('fs')
expect    = require('chai').expect
jsdom     = require('jsdom').jsdom
html      = fs.readFileSync("#{__dirname}/index.html", 'utf-8')
document  = jsdom(html)
window    = document.parentWindow
jQuery    = $ = require('jquery')(window)

data =
  user: 'Zombie Pirate'

describe 'Serialize Form to JSON', ->

  it 'should serialize a form to a correct JSON object', ->
    json = $('form').serializeJSON()
    expect(json).to.deep.equal(data)
