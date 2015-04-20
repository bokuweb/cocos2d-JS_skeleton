gulp = require 'gulp'
source = require 'vinyl-source-stream'
browserify = require 'browserify'

gulp.task 'build', ->
  browserify
      entries : ['./src/main.coffee']
      extensions: ['.coffee', '.js']
    .transform 'coffeeify'
    .bundle()
    .pipe source 'main.js'
    .pipe gulp.dest './'

