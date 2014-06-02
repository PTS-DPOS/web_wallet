/* Exports a function which returns an object that overrides the default &
 *   plugin file patterns (used widely through the app configuration)
 *
 * To see the default definitions for Lineman's file paths and globs, see:
 *
 *   - https://github.com/linemanjs/lineman/blob/master/config/files.coffee
 */
module.exports = function(lineman) {
  //Override file patterns here
  return {
    js: {
      vendor: [
        "vendor/js/jquery.js",
        //"vendor/js/bootstrap.js",
        //"vendor/js/jasny-bootstrap.js",
        //"vendor/js/ark.js",
        "vendor/js/angular.js",
        "vendor/js/angular-resource.js",
        //"vendor/js/angular-route.js",
        "vendor/js/angular-ui-router.js",
        "vendor/js/ui-bootstrap-tpls.js",
	 	"vendor/js/ui-bootstrap-tpls.js",
	 	"vendor/js/ng-grid-2.0.11.debug.js"
      ],
      app: [
        "app/js/app.js",
        "app/js/**/*.js"
      ]
    },

//    less: {
//      compile: {
//        options: {
//          paths: ["vendor/css/normalize.css", "vendor/css/**/*.css", "app/css/**/*.less"]
//        }
//      }
//    },

    css: {
      vendor: [
        "vendor/css/bootstrap.css",
        //"vendor/css/jasny-bootstrap.css",
        "vendor/css/font-awesome.css",
        "vendor/css/ark.css",
        "vendor/css/ng-grid.css"
      ],
      app: [
        //TODO: make main.css compatible with ng-grid
        "app/css/main.css",
        "app/css/my-ng-grid.css"
      ]
    }

  };
};

