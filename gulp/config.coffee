paths = require './paths'

config =
  host: "127.0.0.1"
  port: "8080"
  ext: [
    "#{paths.static.ext}/jquery.js"
    "#{paths.static.ext}/moment.js"
    "#{paths.static.ext}/alert.js"
    "#{paths.static.ext}/button.js"
    "#{paths.static.ext}/transition.js"
    "#{paths.static.ext}/collapse.js"
    "#{paths.static.ext}/dropdown.js"
    "#{paths.static.ext}/tooltip.js"
  ]
  style: [
    "#{paths.src.style}/style.less"
  ]
  script: [
    "#{paths.src.script}/**/*.coffee"
    "#{paths.src.script}/**/*.js"
  ]


module.exports = config
