﻿import sk.prasa.webapis.picasa.*;
import sk.prasa.webapis.picasa.core.command.*;
import sk.prasa.webapis.picasa.core.receiver.*;
import sk.prasa.webapis.picasa.core.receiver.photos.*;

/**
 * @author Michal Gron (michal.gron@gmail.com)
 */

[Event(name="photosGetList", type="sk.prasa.webapis.picasa.events.PicasaResultEvent")]
[Event(name="photosGetListByTag", type="sk.prasa.webapis.picasa.events.PicasaResultEvent")]	

class sk.prasa.webapis.picasa.core.Photos
{
	/**
	 * List of users photos in specified album 
	 * Loads e.g. http://picasaweb.google.com/data/feed/api/user/userID/albumid/albumID?kind=photo
	 * 
	 * @param userid String Picasaweb user id
	 * @param albumid String Picasaweb album id
	 * @param params String Params to alter the feed url
	 */
	public function list(userid : String, albumid : String, params : UrlParams) : Void
	{
		var s : String = "user/" + userid + "/albumid/" + albumid;
		var p : UrlParams = PicasaService.getInstance().mergeUrlParams(params);
			p.kind = "photo";	// overwrite!
			p.tag = null;
			p.q = null;
			
		var tReceiver : IReceiver = new PhotosListReceiver();
		var tCommand : ICommand = new GetFeedCommand(tReceiver, s, p.toString());
		var tInvoker : Invoker = new Invoker();
		
		tInvoker.setCommand(tCommand);
		tInvoker.executeCommand();
	}

	/**
	 * List of tagged users photos in specified album  
	 * Loads e.g. http://picasaweb.google.com/data/feed/api/user/userID/albumid/albumID?tag=sometag
	 * 
	 * @param userid String Picasaweb user id
	 * @param albumid String Picasaweb album id
	 * @param tag String Tag
	 * @param params String Params to alter the feed url
	 */
	public function list_by_tag(userid : String, albumid : String, tag : String, params : UrlParams) : Void
	{
		var s : String = "user/" + userid + "/albumid/" + albumid;
		var p : UrlParams = PicasaService.getInstance().mergeUrlParams(params);
			p.kind = "photo";	// overwrite!
			p.tag = tag;
			p.q = null;
		
		var tReceiver : IReceiver = new PhotosListByTagReceiver();
		var tCommand : ICommand = new GetFeedCommand(tReceiver, s, p.toString());
		var tInvoker : Invoker = new Invoker();
		
		tInvoker.setCommand(tCommand);
		tInvoker.executeCommand();
	}
	
	/**
	 * Retrieves single photo entry
	 * NOT YET IMPLEMENTED  
	 * Loads e.g. 
	 * 
	 * @param userid String Picasaweb user id
	 * @param albumid String Picasaweb album id
	 * @param photoid String Picasaweb photo id
	 * @param params String Params to alter the feed url
	 */
	public function single(userid : String, albumid : String, photoid : String, params : UrlParams) : Void
	{
		throw new PicasaError("Not yet implemented.");
	}
}
