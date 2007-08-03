﻿import com.bourre.events.FrontController;
import com.bourre.log.PixlibStringifier;
import com.bourre.core.Model;

import controllers.RunApplication;

import events.EventList;
import models.*;
/**
  @author Michal Gron (michal.gron@gmail.com)
 */
class controllers.Controller extends FrontController
{
	private static var __instance:Controller;
	
	public static function getInstance() : Controller 
	{
		if (!__instance) {
			__instance = new Controller();
		}
		
		return __instance;
	}
	
	private function Controller()
	{
		super();
	}
	
	public function initialize() : Void
	{
		push(EventList.RUN_APPLICATION, new RunApplication());
	}
	public function pause():Void
	{
		var tModel:ModelApplication = ModelApplication(Model.getModel(ModelList.MODEL_APPLICATION));
			tModel.pause();
	}
	public function play():Void
	{
		var tModel:ModelApplication = ModelApplication(Model.getModel(ModelList.MODEL_APPLICATION));
			tModel.play();
	}
	public function toString():String 
	{
		return PixlibStringifier.stringify(this);
	}
}