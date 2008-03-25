﻿/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
import com.bourre.commands.Command;
import com.bourre.core.Model;
import com.bourre.events.EventBroadcaster;

import sk.prasa.webapis.picasa.Photo;
import sk.prasa.webapis.picasa.PicasaError;

import model.*;
import business.*;
import command.IResponder;
import control.InitializeEvent;
import control.GetPhotosEvent;

class command.GetPhotosCommand implements Command, IResponder
{
	private var model:ModelApplication; 
	
	public function execute(e:GetPhotosEvent):Void
	{
		model = ModelApplication(Model.getModel(ModelList.MODEL_APPLICATION));
		
		var tQuery:String = e.query;
		var d:PhotosDelegate = new PhotosDelegate(this);
			d.search(tQuery);
	}
	
	public function result(data:Array):Void
	{
		var tTotalResults:Number = (data.length != 0) ? data[0].album.openSearch.totalResults : 0;
		var tStartIndex:Number = (data.length != 0) ? data[0].album.openSearch.startIndex: 0;
		var tItemsPerPage:Number = (data.length != 0) ? data[0].album.openSearch.itemsPerPage: 0;
		
		model.photos.init();

		for(var a:Number = 0; a < data.length; a++)
		{
			var tPhoto:Photo = data[a];
			model.photos.push(tPhoto);
		}
		
		EventBroadcaster.getInstance().broadcastEvent(new InitializeEvent(tTotalResults, tStartIndex, tItemsPerPage));
	}
	
	public function fault(error:PicasaError):Void
	{
		trace("GetPhotosCommand failed: "+error.message);
	}
}