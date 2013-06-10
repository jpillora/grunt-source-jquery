module.exports = function(grunt) {


  grunt.loadNpmTasks('grunt-contrib-uglify');

  // ==================
  // above here the working directory is the grunt directory
  var base = grunt.option("basedir");
  if(!base) throw "Missing 'basedir' option";
  grunt.file.setBase(base);
  // below here the working directory is the project directory
  // ==================

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> - <%= pkg.homepage %>\n'+
                ' * <%= pkg.license %> <%= grunt.template.today("yyyy-mm-dd") %> - <%= pkg.author %>\n'+
                ' */\n'
      },
      dist: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'dist/<%= pkg.name %>.min.js'
      }
    }
  });


  grunt.registerTask('default', ['uglify']);
};