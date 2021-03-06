package  
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import sk.prasa.examples.albumskeleton.ApplicationFacade;
	import sk.prasa.examples.albumskeleton.view.components.AlbumView;
	import sk.prasa.examples.albumskeleton.view.components.NavigationView;
	import sk.prasa.examples.albumskeleton.view.components.PreloaderView;
	import sk.prasa.examples.albumskeleton.view.components.ThumbsView;		

	[SWF(width="320", height="240", backgroundColor="0xffffff", frameRate="31")]
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class AlbumSkeleton extends Sprite 
	{
		public var album : AlbumView;
		public var thumbs : ThumbsView;
		public var preloader : PreloaderView;
		public var navigation : NavigationView; 
		
		private var facade : ApplicationFacade;
		
		public function AlbumSkeleton()
		{
			initializeStage();
			initializeViews();
			
			facade = ApplicationFacade.getInstance();
			facade.startup(this);
		}
		
		private function initializeStage() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		
		private function initializeViews() : void
		{
			album = new AlbumView();
			thumbs = new ThumbsView();
			thumbs.x = 322;
			
			preloader = new PreloaderView();
			navigation = new NavigationView();
			
			this.addChild(album);
			this.addChild(thumbs);
			this.addChild(preloader);
			this.addChild(navigation);
		}
	}
}
