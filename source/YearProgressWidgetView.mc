using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Lang;

class YearProgressWidgetView extends WatchUi.View {

    function initialize() {
        View.initialize();
         
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
       
        var today = new Time.Moment(Time.today().value());

	    var today2 = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format(
            "$1$:$2$:$3$ $4$ $5$ $6$ $7$",
            [
                today2.hour,
                today2.min,
                today2.sec,
                today2.day_of_week,
                today2.day,
                today2.month,
                today2.year
            ]
        );
        System.println(dateString); // e.g. "16:28:32 Wed 1 Mar 2017"
    	
    	System.println(today2); 
    	 
    	 
    	var options = {
		//    :year   => today.year(),
		    :month  => 1,
		    :day    => 1,
		    :hour   => 0,
		    :minute => 1
		};
    	
    	
    	var firstDayOfTheYear =  Gregorian.moment(options); 
    	System.println(Gregorian.info(today, Time.FORMAT_MEDIUM)); 
   		var progressInSeconds = today.subtract(firstDayOfTheYear);
        percent = 0.0d;
   		percent = (progressInSeconds.value().toDouble() / Gregorian.SECONDS_PER_YEAR.toDouble())*100.toDouble();
		System.println(progressInSeconds.value()); 
		System.println(Gregorian.SECONDS_PER_YEAR); 
        System.println(100*progressInSeconds.value());
        System.println(progressInSeconds.value().toDouble() / Gregorian.SECONDS_PER_YEAR.toDouble());
		System.println(percent); 

		var percent_label = View.findDrawableById("percent_label");
		percent_label.setText(percent.format("%02d")+"%");
		percent_label.setJustification(1);

    	var oneYear = new Time.Duration(Gregorian.SECONDS_PER_YEAR);
       
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    
    	
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    

}
