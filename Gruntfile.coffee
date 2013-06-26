
module.exports = (grunt) ->

  #resolve options
  env = grunt.option "env"
  env = "dev" unless env in ["dev","prod"]
  dev = env is "dev"

  #load external tasks
  grunt.loadNpmTasks "grunt-jpillora-watch"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-coffee"

  #above here the working directory is the grunt directory
  gruntdir = process.cwd()
  base = grunt.option "basedir"
  throw "Missing 'basedir' option" unless base
  grunt.file.setBase base
  #below here the working directory is the project directory

  source = grunt.file.readJSON "./Gruntsource.json"
  pkg = grunt.file.readJSON 'package.json'

  #README templates
  grunt.registerTask 'readme', 'Allow templating in your README.md', ->
    md = newmd = grunt.file.read 'README.md'

    while true
      m = newmd.match /<(\w+)>([\S\s]*?)<\/\w+>/
      break unless m
      key = m[1]
      val = source[key] or pkg[key] or 'missing'
      encode = "<#{key}>#{val}</#{key}>".replace(/>/g,'⦔').replace(/</g,'⦓')
      newmd = newmd.replace m[0], encode

    newmd = newmd.replace(/⦔/g,'>').replace(/⦓/g,'<')

    if md isnt newmd
      grunt.file.write 'README.md', newmd
      grunt.log.writeln "Updated README.md"

  #configuration
  grunt.initConfig
    pkg: pkg

    #watcher
    watch:
      options:
        gruntCwd: gruntdir
      scripts:
        files: 'src/scripts/**/*.coffee'
        tasks: 'scripts'
      readme:
        files: 'README.md'
        tasks: 'readme'

    #tasks
    coffee:
      dist:
        files:
          "dist/<%= pkg.name %>.js": "src/**/*.coffee"
        options:
          bare: false
          join: true

    uglify:
      options: 
        banner: '/*! <%= pkg.title || pkg.name %> - <%= pkg.homepage %>\n'+
                ' * <%= grunt.template.today("yyyy-mm-dd") %> - <%= pkg.license %> - <%= pkg.author %>\n'+
                ' */\n'
      dist:
        files:
          "dist/<%= pkg.name %>.min.js": "dist/<%= pkg.name %>.js"

  #task groups
  grunt.registerTask "build",   ["coffee","uglify","readme"]
  grunt.registerTask "default", ["build","watch"]
