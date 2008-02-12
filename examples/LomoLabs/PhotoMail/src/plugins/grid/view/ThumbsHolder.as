/**
 * @author michal.gron@gmai.com
 */

import com.bourre.ioc.visual.AbstractMovieClipHelper;
import com.bourre.ioc.plugin.IPlugin;
import com.bourre.commands.Delegate;
import com.bourre.data.libs.GraphicLib;
import com.bourre.data.libs.LibEvent;
import com.bourre.data.libs.ILibListener;
import plugins.grid.control.PhotoClickEvent;
import plugins.grid.control.PhotoChangedEvent;
import plugins.grid.view.Thumb;

class plugins.grid.view.ThumbsHolder extends AbstractMovieClipHelper implements ILibListener
{	
	public var grid:sk.prasa.visual.layout.GridLayout;
		
	public function ThumbsHolder(owner:IPlugin, name:String, mc:MovieClip)
	{
		super(owner, name, mc);

		grid = new sk.prasa.visual.layout.GridLayout(4, 6);
		grid.addListener(this);
		
		centerize();
	}
	
	public function addChild(aId:String, aUrl:String, aSummary:String):Void
	{
		var tHolder:MovieClip = view.createEmptyMovieClip("thumb_holder_"+aId,view.getNextHighestDepth());
		var tGL:GraphicLib = new GraphicLib(tHolder, 5, true);
		var tThumb:Thumb = new Thumb(getOwner(), aId, tHolder, aSummary);
			
			addListener(tThumb);
			
		tGL.addListener(this);
		tGL.load(aUrl);

		grid.addChild(tHolder);
	}
	
	private function centerize():Void
	{
		move(Math.round(Stage.width/2 - view._width/2), Math.round(Stage.height/2 - view._height/2));
	}
	
	// Listening to Layout Manager
	public function complete():Void
	{
		centerize();
	}
	
	public function onLoadInit(e:LibEvent):Void
	{		
		grid.draw();
	}
	
	public function onLoadProgress(e:LibEvent):Void
	{
	}
	
	public function onLoadComplete(e:LibEvent):Void
	{	
	}
	
	public function onTimeOut(e:LibEvent):Void
	{
		trace("ERROR: Photo loading time out: "+e.getName());
	}
	
	public function photo_changed_event(evt:PhotoChangedEvent):Void
	{	
		notifyChanged(evt);
	}
}