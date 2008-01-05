/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
import com.bourre.visual.MovieClipHelper;
import com.bourre.events.EventBroadcaster;

import view.*;
import control.*;
import model.*;

class Application extends MovieClipHelper
{
	private function Application(mc:MovieClip)
	{
		super(ViewList.APPLICATION, mc);
		initialize(mc);
	}
	
	private function initialize(mc:MovieClip):Void
	{
		Stage.addListener(this);
		
		Controller.getInstance().initialize();
	
		var view_l:LoadingBar = new LoadingBar(ViewList.LOADING_BAR, mc.createEmptyMovieClip(ViewList.LOADING_BAR, 10010));
		var view_t:ThumbHolder = new ThumbHolder(ViewList.THUMB_HOLDER,mc.createEmptyMovieClip(ViewList.THUMB_HOLDER,20));
		var view_m:MainView = new MainView(ViewList.MAIN_VIEW, mc.createEmptyMovieClip(ViewList.MAIN_VIEW, 25));
				
		var model:ModelApplication = new ModelApplication();
			model.addListener(view_t);
			model.addListener(view_l);
			model.addListener(view_m);
			model.initialize();
	}
	
	public function onResize():Void
	{
		EventBroadcaster.getInstance().broadcastEvent(new ScreenResizeEvent());
	}
		
	public static function main(mc:MovieClip) : Void 
	{
		Stage.align = "TL";
		Stage.scaleMode = "noScale";
		
		var o:Application = new Application(mc); 
	}
}