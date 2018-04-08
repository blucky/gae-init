fs = require 'fs'
gulp = require('gulp-help') require 'gulp'
mainNPMFiles = require 'npmfiles'
$ = require('gulp-load-plugins')()
paths = require '../paths'


gulp.task 'npm', false, ->
  gulp.src 'package.json'
  .pipe $.plumber()
  .pipe $.start()


gulp.task 'copy_files', false, ->
  gulp.src mainNPMFiles({
    nodeModulesPath: '../../node_modules'
  })
  .pipe gulp.dest paths.static.ext


gulp.task 'pip', false, ->
  gulp.src('run.py').pipe $.start [{match: /run.py$/, cmd: 'python run.py -d'}]


gulp.task 'zip', false, ->
  fs.exists paths.py.lib_file, (exists) ->
    if not exists
      fs.exists paths.py.lib, (exists) ->
        if exists
          gulp.src "#{paths.py.lib}/**"
          .pipe $.plumber()
          .pipe $.zip 'lib.zip'
          .pipe gulp.dest paths.main


gulp.task 'init', false, $.sequence 'pip', 'copy_files'
