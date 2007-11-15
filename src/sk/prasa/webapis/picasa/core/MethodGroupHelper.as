﻿/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
import sk.prasa.webapis.picasa.Photo;

import sk.prasa.webapis.picasa.PicasaService;
import sk.prasa.webapis.picasa.PicasaError;
import sk.prasa.webapis.picasa.core.*;
import sk.prasa.webapis.picasa.events.PicasaResultEvent;

import com.bourre.data.libs.XMLToObject;

class sk.prasa.webapis.picasa.core.MethodGroupHelper
{
	public static function invokeMethod(service:PicasaService, 
										callBack:Function, 
										signed:Boolean,
										suffix:String,
										params:Array):Void
	{
			
		// Create an array to store our name/value pairs
		// for the query because during signing we need to sort
		// these alphabetically
		var args:Array = new Array();
		var tSuffix:String = (suffix != "" && suffix != "") ? suffix : "";
		//args.push(new NameValuePair("api_key", service.api_key));
		//args.push(new NameValuePair("method", method));
		
		
		for(var i:Number = 0; i < params.length; i++)
		{
			if (params[i] instanceof NameValuePair)
			{
				args.push(params[i]);
			} else
			{
				args.push(new NameValuePair("param"+i, params[i].toString()));
			}
		}
		
		/*
		// If a user is authenticated, automatically add their token
		if (service.permission != AuthPerm.NONE && service.token)
		{
			args.push(new NameValuePair( "auth_token", service.token));
			// auto-sign the call because the user is authenticated
			signed = true;
		}
		*/
		/*
		// Sign the call if we have to, or if the user is logged in
		if (signed)
		{	
			// sign the call according to the documentation point #8
			// here: http://www.flickr.com/services/api/auth.spec.html
			args.sortOn( "name" );
			var sig:String = service.secret;
			for ( var j:int = 0; j < args.length; j++ ) {
				sig += args[j].name.toString() + args[j].value.toString();	
			}	
			args.push( new NameValuePair( "api_sig", MD5.hash( sig ) ) );
		}
		*/
		

		var query:String = ""+tSuffix+"?";
		for (var k:Number = 0; k < args.length; k++ )
		{
			query += args[k].name + "=" + args[k].value + "&";	
		}
		
		trace("loading: "+PicasaService.END_POINT + query);
		
		var tLoader:XMLToObject = service.xmlLoader;
			tLoader.addEventListener(XMLToObject.onLoadInitEVENT, callBack);
			
			tLoader.load(PicasaService.END_POINT + query);			
	}
	
	public static function processAndDispatch(service:PicasaService, response:Object, result:PicasaResultEvent, parseFunction:Function):Void 
	{
		// Process the response to create an object for return values
		var rsp:Object = processResponse(response, parseFunction);

		// Copy some properties from the response to the result event
		result.success = rsp.success;
		result.data = rsp.data;
		result.error = rsp.error;

		service.broadcastEvent(result);
	}
	
	public static function processResponse(picasaResponse:Object, parseFunction:Function):Object
	{
		//trace(picasaResponse.error.code+":"+picasaResponse.error.message);
		
		var result:Object = {};
			result.data = {};
			result.error = {};
		
		if (picasaResponse.error == null)
		{
			result.success = true;
			
			if(parseFunction == null)
			{
				result.data = picasaResponse;
			} else
			{
				result.data = parseFunction(picasaResponse);	
			}			
		} else
		{
			result.success = false;
			
			var error:PicasaError = new PicasaError();
				error.code = picasaResponse.error.code;
				error.message = picasaResponse.error.message;
				
				result.error = error;
		}
		
		return result;			
	}
	
	
	public static function parsePhotoList(o:Object):Array
	{
		var tRes:Array = [];
		
		for(var a:Number = 0; a < o.entry.length; a++)
		{
			tRes.push(new Photo(o.entry[a]));
		}
		
		// o should be a parsed xml to object
		return tRes;
	}
}