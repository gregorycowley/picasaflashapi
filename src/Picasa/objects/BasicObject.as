﻿/**
 * @author Michal Gron (michal.gron@gmail.com)
 */
import com.bourre.log.PixlibStringifier;

class Picasa.objects.BasicObject
{
	// 
	public function BasicObject()
	{
	}
	
	// 
	public function toString():String 
	{
		return PixlibStringifier.stringify(this);
	}
}