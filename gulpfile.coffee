gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
watchify    = require 'gulp-watchify'
plumber     = require 'gulp-plumber'
runSequence = require 'run-sequence'
  .use gulp

gulp.task 'build:coffee', ->
  gulp.src 'src/*.coffee'
    .pipe plumber()
    .pipe coffee()
    .pipe gulp.dest 'js'

gulp.task 'watchify', watchify (watchify)->
  gulp.src 'js/main.js'
    .pipe plumber()
    .pipe watchify
      watch : on
    .pipe gulp.dest './'

gulp.task 'watch', ['build:coffee'], ->
  gulp.watch 'src/*.coffee', []
    .on 'change', ->
      runSequence 'build:coffee', 'watchify'
