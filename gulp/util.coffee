beeper = require('beeper')


onError = (err) ->
  beeper()
  console.log err
  this.emit 'end'


module.exports = {onError}
