﻿/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
import control.InitializeEvent;

import com.bourre.commands.Command;
import com.bourre.core.Model;
import com.bourre.data.libs.LibStack;
import com.bourre.data.libs.GraphicLib;
import com.bourre.visual.MovieClipHelper;

import model.*;
import view.*;

class command.InitializeCommand implements Command
{
	private var model:ModelApplication; 
	
	public function execute(evt : InitializeEvent) : Void
	{
		model = ModelApplication(Model.getModel(ModelList.MODEL_APPLICATION));

		var tPhotoHolder : PhotoHolder = PhotoHolder(MovieClipHelper.getMovieClipHelper(ViewList.PHOTO_HOLDER));
		var tThumbHolder : ThumbHolder = ThumbHolder(MovieClipHelper.getMovieClipHelper(ViewList.THUMB_HOLDER));

		var tPLibStack:LibStack = new LibStack();
			tPLibStack.addListener(tPhotoHolder);
			
		var tTLibStack:LibStack = new LibStack();
			tTLibStack.addListener(tThumbHolder);

		for(var a:Number = 0; a < model.photos.length; a++)
		{
			var tItem:sk.prasa.webapis.picasa.Photo = model.photos[a];
			var tPhoto:view.Photo = tPhotoHolder.addChild(tItem.gphoto.id, (a != 0));
			var tThumb:view.Thumb = tThumbHolder.addChild(tItem.gphoto.id, tItem.summary);
		
			model.addListener(tPhoto);
			model.addListener(tThumb);
			
			tPLibStack.enqueue(new GraphicLib(tPhoto.view, 5), tItem.gphoto.id, tItem.content.src);			
			tTLibStack.enqueue(new GraphicLib(tThumb.view, 5), tItem.gphoto.id, tItem.media.thumbnail[0].url);
		}
		
		tTLibStack.execute();
		tPLibStack.execute();
	}
}