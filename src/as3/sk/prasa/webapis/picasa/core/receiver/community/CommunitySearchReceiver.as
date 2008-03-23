package sk.prasa.webapis.picasa.core.receiver.community
{
	import flash.net.URLLoader;
	import flash.events.Event;
	
	import sk.prasa.webapis.picasa.core.receiver.GetFeedReceiver;
	import sk.prasa.webapis.picasa.core.receiver.IReceiver;
	import sk.prasa.webapis.picasa.events.PicasaEvent;
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 */
	
	public class CommunitySearchReceiver extends GetFeedReceiver implements IReceiver 
	{
		override public function result(evt : Event) : void
		{
			var loader : URLLoader = URLLoader(evt.target);
			process(new XML(loader.data), PicasaEvent.COMMUNITY_GET_SEARCH);
		}
	}
}
