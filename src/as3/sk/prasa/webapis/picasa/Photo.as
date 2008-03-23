package sk.prasa.webapis.picasa 
{	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 */
	
	public class Photo
	{
		public var id : String;
		public var published : String;
		public var updated : String;
		public var category : Category;
		public var title : String;
		public var links : Array;
		public var gphoto : GPhoto;
		public var media : Media;
		public var content : Content;
		public var exif : Exif;
		public var geo : Geo;
		public var album : Album;
		
		private var __summary : String;
		
		default xml namespace = "http://www.w3.org/2005/Atom";
		
		public function Photo(item : XML, parent : XML = null)
		{			
			if(parent != null) album = new Album(parent);

			id = item.id;
			published = item.published;
			updated = item.updated;
			category = new Category(item.category.@term, item.category.@scheme);
			title = item.title;
			__summary = item.summary;
			links = getLinks(item);
			content = new Content(item.content.@type, item.content.@src);
			gphoto = new GPhoto(item, KindType.PHOTO);
			media = new Media(item);
			geo = new Geo(item);
			exif = new Exif(item);
			
			trace(toString());
		}
		 
		public function get summary() : String
		{
			//return (typeof __summary) == "string" ? __summary : "";
			return __summary;
		}
		 
		public function set summary(v : String) : void
		{
			__summary = v;
		}
		
		//TODO : test this please!
		private function getLinks(item : XML) : Array
		{
			var tRes : Array = [];
			
			for each(var link : XML in item.link)
			{
				tRes.push(new Link(link.@href, link.@type, link.@rel));
			}
			
			return tRes;
		}
		
		public function toString() : String
		{
			return "[Photo" +
				" id=" + id +
				", published=" + published +
				", updated=" + updated +
				", category=" + category.toString() +
				", title=" + title +
				", summary= " + summary +
				", links=" + links.join("/") +
				", content=" + content.toString() +
				", gphoto=" + gphoto.toString() +
				", media=" + media.toString() +
				", geo=" + geo.toString() +
				", exif=" + exif.toString() +
				"]";
		}
	}
}

/*
<entry>
	<id>http://picasaweb.google.com/data/entry/api/user/thisispinkfu/albumid/5150986992011782785/photoid/5168765947231095938</id>
	<published>2008-02-19T18:51:42.000Z</published>
	<updated>2008-02-19T18:51:42.000Z</updated>
	<category scheme="http://schemas.google.com/g/2005#kind" term="http://schemas.google.com/photos/2007#photo"/>
	<title type="text">splitzer_by_day_01.jpg</title>
	<summary type="text"/>
	<link rel="http://schemas.google.com/g/2005#feed" type="application/atom+xml" href="http://picasaweb.google.com/data/feed/api/user/thisispinkfu/albumid/5150986992011782785/photoid/5168765947231095938"/>
	<link rel="alternate" type="text/html" href="http://picasaweb.google.com/lh/photo/Y6mU3LfFTxCenctq5fuewg"/>
	<link rel="self" type="application/atom+xml" href="http://picasaweb.google.com/data/entry/api/user/thisispinkfu/albumid/5150986992011782785/photoid/5168765947231095938"/>
	<link rel="edit" type="application/atom+xml" href="http://picasaweb.google.com/data/entry/api/user/thisispinkfu/albumid/5150986992011782785/photoid/5168765947231095938/1203447102518763?tok=MWwTgA_qFxVyX7u_Dq5Yg17itLU"/>
	<link rel="edit-media" type="image/jpeg" href="http://picasaweb.google.com/data/media/api/user/thisispinkfu/albumid/5150986992011782785/photoid/5168765947231095938/1203447102518763?tok=QdW8ubXKaFUtOZcaLcjy8dXS_YQ"/>
	<link rel="media-edit" type="image/jpeg" href="http://picasaweb.google.com/data/media/api/user/thisispinkfu/albumid/5150986992011782785/photoid/5168765947231095938/1203447102518763?tok=QdW8ubXKaFUtOZcaLcjy8dXS_YQ"/>
	<link rel="http://schemas.google.com/photos/2007#report" type="text/html" href="http://picasaweb.google.com/lh/reportAbuse?uname=thisispinkfu&amp;aid=5150986992011782785&amp;iid=5168765947231095938"/>
	<gphoto:id>5168765947231095938</gphoto:id>
	<gphoto:version>1203447102518763</gphoto:version>
	<gphoto:position>0.0</gphoto:position>
	<gphoto:albumid>5150986992011782785</gphoto:albumid>
	<gphoto:width>640</gphoto:width>
	<gphoto:height>432</gphoto:height>
	<gphoto:size>130201</gphoto:size>
	<gphoto:client>picasa</gphoto:client>
	<gphoto:checksum>5010d6a4</gphoto:checksum>
	<gphoto:timestamp>1203447102000</gphoto:timestamp>
	<exif:tags>
		<exif:imageUniqueID>9f621bc616845e7b03b235acad04d122</exif:imageUniqueID>
	</exif:tags>
	<gphoto:commentingEnabled>true</gphoto:commentingEnabled>
	<gphoto:commentCount>0</gphoto:commentCount>
	<media:group>
		<media:title type="plain">splitzer_by_day_01.jpg</media:title>
		<media:description type="plain"/>
		<media:keywords/>
		<media:thumbnail url="http://lh6.google.com/thisispinkfu/R7slPmPYTII/AAAAAAAABU0/T7V3jgS-h7s/s72/splitzer_by_day_01.jpg" height="48" width="72"/>
		<media:thumbnail url="http://lh6.google.com/thisispinkfu/R7slPmPYTII/AAAAAAAABU0/T7V3jgS-h7s/s144/splitzer_by_day_01.jpg" height="97" width="144"/>
		<media:thumbnail url="http://lh6.google.com/thisispinkfu/R7slPmPYTII/AAAAAAAABU0/T7V3jgS-h7s/s288/splitzer_by_day_01.jpg" height="194" width="288"/>
		<media:content url="http://lh6.google.com/thisispinkfu/R7slPmPYTII/AAAAAAAABU0/T7V3jgS-h7s/splitzer_by_day_01.jpg" height="432" width="640" type="image/jpeg" medium="image"/>
		<media:credit>Pink-fu</media:credit>
	</media:group>
</entry>

*/