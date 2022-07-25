using Toybox.Application;

var percent;

class YearProgressWidgetApp extends Application.AppBase {


	
    function initialize() {
    	percent=0;
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