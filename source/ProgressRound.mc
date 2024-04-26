using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class ProgressRound extends Ui.Drawable {

    function initialize(params) {
        Drawable.initialize(params);
    }

	function draw(dc) {
		var fraction = percent/100f;// timer.fraction();
		var degrees = fraction*360;
        var w = dc.getWidth()/2; //15
        var x = dc.getWidth()/2;
        var y = dc.getHeight()/2;
        var r = x-w/2;
        if ( x != y ) {
        	// Bit more for semi-round
        	r += 2;
    	}
        dc.setColor(mainColor, Gfx.COLOR_TRANSPARENT);
    	if( degrees == 0 ) {
    		dc.setPenWidth(1);
    		dc.drawLine( x, 0, x, w );
    	} else {
        	dc.setPenWidth(w);
        	dc.drawArc( x, y, r, Gfx.ARC_CLOCKWISE, 90, 90 - degrees );
    	}
	} 
}