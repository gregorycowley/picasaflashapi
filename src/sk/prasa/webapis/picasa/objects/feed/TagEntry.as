/*
 * The MIT License
 * 
 * Copyright (c) 2008 Michal Gron (michal.gron@gmail.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package sk.prasa.webapis.picasa.objects.feed 
{
	import sk.prasa.webapis.picasa.objects.GPhoto;
	import sk.prasa.webapis.picasa.objects.Kind;
	import sk.prasa.webapis.picasa.objects.feed.Entry;
	import sk.prasa.webapis.picasa.objects.feed.IEntry;	
	
	/**
	 * 
	 */
	public class TagEntry extends Entry implements IEntry 
	{
		public function TagEntry(data : XML)
		{
			super(data);
		}
		
		//dopisat metody typicke pre TagEntry
		
		public function get gphoto() : GPhoto
		{
			var tGPhoto : GPhoto = new GPhoto(this.data, Kind.TAG);
			return tGPhoto;
		}
		
		public function set gphoto(aGPhoto : GPhoto) : void
		{
			// TODO: ...
		}
	}
}
