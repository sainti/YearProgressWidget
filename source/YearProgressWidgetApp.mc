using Toybox.Application;
using Toybox.Graphics as Gfx;


var percent;
var mainColor;

class YearProgressWidgetApp extends Application.AppBase {


	
    function initialize() {
    	percent=0;
        mainColor = Gfx.COLOR_RED;
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new YearProgressWidgetView() ];
    }

    (:glance)
	function getGlanceView() {
        return [ new MyGlanceView() ];
    }    

}