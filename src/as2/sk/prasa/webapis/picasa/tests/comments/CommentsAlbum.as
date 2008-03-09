/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
import asunit.framework.TestCaseXml;
import asunit.framework.TestCase;

import sk.prasa.webapis.picasa.*;
import sk.prasa.webapis.picasa.events.*;
import sk.prasa.webapis.picasa.core.*;

class sk.prasa.webapis.picasa.tests.comments.CommentsAlbum extends TestCase
{
	private var className:String = "CommentsAlbum";
	private var service:PicasaService;
	private var xmlData:Comments;
	private var event:PicasaResultEvent;
	
	public function CommentsAlbum(testMethod:String)
	{
		super(testMethod);
	}
	
	public function run():Void
	{
		service = new PicasaService();
		
		service.addEventListener(PicasaResultEvent.COMMENTS_GET_ALBUM, this);
		service.comments.album("picasaflashapi","5134889498689547361");
	}

	private function commentsGetAlbum(evt:PicasaResultEvent):Void
	{
		event = evt;
		
		super.run();
	}
	
	public function setUp():Void
	{
	}

	public function tearDown():Void
	{
		delete service;
	}

	public function testInstantiated():Void
	{
		assertTrue("PicasaService instantiated", service instanceof PicasaService);
	}
	
	public function test_success():Void
	{
		assertTrue("comments album failed: "+event.error.message, event.success);
	}
	
	public function test_data():Void
	{
		for(var a:Number = 0; a < event.data.length; a++)
		{
			assertNotUndefined("comment ("+event.data[a].content+") for album "+event.data[a].gphoto.photoid+" is undefined", event.data[a].content);
		}
	}
}
