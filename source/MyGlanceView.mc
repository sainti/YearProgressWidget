using Toybox.WatchUi;
using Toybox.Time           as Date;
using Toybox.Time.Gregorian as Greg;

(:glance)
class MyGlanceView extends WatchUi.GlanceView {

    function initialize() {
        GlanceView.initialize();    	         
    }

    function onLayout(dc) {
      setLayout(Rez.Layouts.GlanceLayout(dc));
      var today = new Time.Moment(Time.today().value());
      var options = {
		    :month  => 1,
		    :day    => 1,
		    :hour   => 0,
		    :minute => 1
		  };
    	

    	var firstDayOfTheYear =  Greg.moment(options); 
    	
   		var progressInSeconds = today.subtract(firstDayOfTheYear);
   		
   		percent = progressInSeconds.value() * 100 / Greg.SECONDS_PER_YEAR;

      var percent_label = View.findDrawableById("percent_label");
		  percent_label.setText(percent+"%");
      
     

    }
    
    function onUpdate(dc) {  
	    View.onUpdate(dc);
       drawProgress(dc, percent,100,Graphics.COLOR_RED);
    }

    function drawProgress(dc, value, maxvalue, codeColor) {
      var h = dc.getHeight();
      var w = dc.getWidth();

      dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
      dc.fillRectangle(value * w / maxvalue + (h / 20), 
                      h / 2 - 1, 
                      w, 
                      h / 20);
      dc.setColor(codeColor, Graphics.COLOR_TRANSPARENT);
      dc.fillRectangle(0, 
                      h / 2 - (h / 20), 
                      value * w / maxvalue, 
                      h / 10 + 1);
  }
}