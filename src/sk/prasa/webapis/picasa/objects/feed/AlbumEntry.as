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
import sk.prasa.webapis.picasa.objects.Geo;
import sk.prasa.webapis.picasa.objects.Kind;
import sk.prasa.webapis.picasa.objects.Media;
import sk.prasa.webapis.picasa.objects.Namespaces;

import flash.geom.Point;
/**
 * AlbumEntry represents a <entry> in the e.g. user feed
 */
public class AlbumEntry extends Entry implements IEntry 
{
	private var georss_ns : Namespace = Namespaces.GEORSS_NS;
	private var gml_ns : Namespace = Namespaces.GML_NS;
	
	public function AlbumEntry(data : XML)
	{
		super(data);
	}
	
	//dopisat metody typicke pre AlbumEntry
	
	public function get gphoto() : GPhoto
	{
		return new GPhoto(this.data, Kind.ALBUM);
	}
	
	public function set gphoto(value : GPhoto) : void
	{
		// TODO: ...
	}
	
	public function get media() : Media
	{
		return new Media(this.data);
	}
	
	public function set media(value : Media) : void
	{
		// TODO: ...
	}
	
	public function get geo() : Geo
	{
		// rewrite this.. if georss_ns is null ... 
		
		var tGeo : Geo = new Geo();
		
		try
		{
			var tGeoArray : Array = this.data.georss_ns::where.gml_ns::Point.gml_ns::pos.split(" ");
			
			tGeo.latitude = tGeoArray[0];
			tGeo.longitude = tGeoArray[1];
			
		} catch(e : Error)
		{
			//if album/photo doesn't contains any geo info
		}
		
		return tGeo;
	}
	
	public function set get(value : Geo) : void
	{
		// TODO: ...
	}
	
	// i think, entry does not have a opensearch nodes 
//	public function get opensearch() : OpenSearch
//	{
//		var tOpenSearch : OpenSearch = new OpenSearch();
//			tOpenSearch.totalResults = Utils.parseNumber(this.data.opensearch_ns::totalResults); 
//			tOpenSearch.startIndex = Utils.parseNumber(this.data.opensearch_ns::startIndex);
//			tOpenSearch.itemsPerPage = Utils.parseNumber(this.data.opensearch_ns::itemsPerPage);
//			
//		return tOpenSearch;
//	}
//	
//	public function set opensearch(aOpenSearch : OpenSearch) : void
//	{
//		// TODO: ...
//	}
}
}
