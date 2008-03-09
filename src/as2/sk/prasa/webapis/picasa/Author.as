﻿/**
 * @author Michal Gron (michal.gron@gmail.com)
 */

class sk.prasa.webapis.picasa.Author
{
	public var name : String;
	public var email : String;
	public var uri : String;
	
	public function Author(n : String, e : String, u : String)
	{
		name = n;
		email = e; 
		uri = u;
	}
	
	public function toString() : String
	{
		return "[Author name=" + name + ", email=" + email + ", uri=" + uri + "]";
	}
}