using Toybox.WatchUi;
using Toybox.Time           as Date;
using Toybox.Time.Gregorian as Greg;
using Toybox.Graphics       as Gfx;

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
   	//	   		percent = (progressInSeconds.value().toDouble() / Gregorian.SECONDS_PER_YEAR.toDouble())*100.toDouble();
   		percent = progressInSeconds.value().toDouble() * 100 / Greg.SECONDS_PER_YEAR.toDouble();

      if (percent<50)
        {
            mainColor=Gfx.COLOR_GREEN;
        }
        else if (percent>=50 && percent <75)
        {
            mainColor = Gfx.COLOR_YELLOW;
        }     
        else if (percent>=75)
        {
            mainColor = Gfx.COLOR_RED;
        }

      var percent_label = View.findDrawableById("percent_label");
      percent_label.setText(percent.format("%02d")+"%");
     

    }
    
    function onUpdate(dc) {  
	    View.onUpdate(dc);
        
       drawProgress(dc, percent,100,mainColor);
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