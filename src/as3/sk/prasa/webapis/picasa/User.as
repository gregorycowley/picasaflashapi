package sk.prasa.webapis.picasa 
{	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 * User kind doesn't have a parent, it's the master kind
	 */
	
	// extends basic feed
	public class User
	{
		public var author : Author;		//base
		public var category : Category;	//base
		public var icon : String;		//base
		public var id : String;			//base
		public var links : Array;		//base
		public var logo : String;		// ! base
		public var rights : String;		// ! base
		public var subtitle : String;	//base
		public var title : String;		//base
		public var updated : String;	//base
		public var generator : Generator;	//base
		
		public var opensearch : OpenSearch;	//ok
		public var gphoto : GPhoto;			//ok
		
		default xml namespace = "http://www.w3.org/2005/Atom";
		
		public function User(item : XML)
		{
			id = item.id;
			updated = item.updated;
			category = new Category(item.category.@term, item.category.@scheme);
			title = item.title;
			subtitle = item.subtitle;
			icon = item.icon;
			links = getLinks(item);
			author = new Author(item.author.name, item.author.email, item.author.uri);
			generator = new Generator(item.generator, item.generator.@version, item.generator.@uri);
			
			opensearch = new OpenSearch(item);
			gphoto = new GPhoto(item, KindType.USER);
			
//			trace(toString());
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
			return "[User " +
				" id=" + id +
				" ,updated=" + updated +
				" ,category=" + category.toString() +
				" ,title=" + title +
				" ,subtitle=" + subtitle +
				" ,icon=" + icon +
				" ,links=" + links.join("/") +
				" ,author=" + author.toString() +
				" ,generator=" + generator.toString() +
				" ,opensearch=" + opensearch.toString() +
				" ,gphoto=" + gphoto.toString() +
				"]";
		}
	}
}
