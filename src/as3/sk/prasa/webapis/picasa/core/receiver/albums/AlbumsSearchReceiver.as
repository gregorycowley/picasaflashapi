package sk.prasa.webapis.picasa.core.receiver.albums
{
	import flash.net.URLLoader;
	import flash.events.Event;
	
	import sk.prasa.webapis.picasa.core.receiver.GetFeedReceiver;
	import sk.prasa.webapis.picasa.core.receiver.IReceiver;
	import sk.prasa.webapis.picasa.events.PicasaEvent;
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 */
	
	public class AlbumsSearchReceiver extends GetFeedReceiver implements IReceiver 
	{
		override public function result(evt : Event) : void
		{
			var loader : URLLoader = URLLoader(evt.target); 
		}
	}
}