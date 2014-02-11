gulp    = require('gulp')
clean   = require('gulp-clean')
coffee  = require('gulp-coffee')
uglify  = require('gulp-uglify')
rename  = require('gulp-rename')

gulp.task 'clean', ->
  gulp.src('*.js', {read: false}).pipe(clean())

gulp.task 'coffee', ->
  gulp.src('./src/*.coffee')
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('./'))

gulp.task 'minify', ->
  gulp.src('./src/*.coffee')
    .pipe(coffee({bare: true}))
    .pipe(uglify())
    .pipe(rename({suffix: '.min', extname: '.js'}))
    .pipe(gulp.dest('./'))

gulp.task('default', ['clean', 'coffee', 'minify'])
