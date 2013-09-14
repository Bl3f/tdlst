fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'

sourcedir = 'todo/static/themes/v1/coffee'
targetdir = 'todo/static/themes/v1/js'


build = (callback) ->
  coffee = spawn 'coffee', ['-c', '-o', targetdir, sourcedir]
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()

  coffee.on 'exit', (code) ->
    callback?() if code is 0


task 'build', "Build #{targetdir} from #{sourcedir}", ->
  build()


task 'watch', 'Watch sources for changes', ->
  coffee = spawn 'coffee', ['-w', '-c', '-o', targetdir, sourcedir]
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()