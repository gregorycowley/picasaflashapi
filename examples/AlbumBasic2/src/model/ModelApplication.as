﻿import com.bourre.core.Model;
import com.bourre.events.EventBroadcaster;
import com.bourre.events.IEvent;
import com.bourre.commands.Delegate;
import model.ModelList;
import control.*;
import vo.Photos;

import sk.prasa.webapis.picasa.PicasaService;

/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
class model.ModelApplication extends Model
{
	public var service:PicasaService;
	public var photos:Photos;
	public var container:MovieClip;
	
	private var PROXY_URL:String = "http://prasa.sk/proxy.php?gws_path=";
	private var __feed:String = PROXY_URL+"http://picasaweb.google.com/data/feed/api/user/thisispinkfu";
	private var __albumid:String = "5094406297232552993";
	
	public function ModelApplication()
	{
		super(ModelList.MODEL_APPLICATION);
	}
	
	public function initialize():Void
	{
		photos = new Photos();
		service = new PicasaService();
		service.addEventListener(PicasaService.ERROR, Delegate.create(this, onServiceError));
		
		EventBroadcaster.getInstance().dispatchEvent(new PhotosGetEvent("thisispinkfu","5094406297232552993"));
	}
	
	private function onServiceError(e:IEvent):Void
	{
		trace("error: "+e.getType());
	}
}