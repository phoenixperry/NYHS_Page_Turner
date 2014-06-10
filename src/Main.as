package
{


	import flash.display.Bitmap;

	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;

	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;

	
	import starling.display.Image;
	import starling.display.Sprite;

	import starling.events.Event;

	import starling.textures.Texture;

	
	public class Main extends Sprite
	{
		[Embed(source="./assets/background.png")]
		private var bg:Class; 
		private var bgTexture:Texture; 

		
		private static const PAGE1:String = "Page1"; 
		private static const PAGE2:String = "Page2"; 
		private static const PAGE3:String = "Page3"; 
		private static const PAGE4:String = "Page4"; 
		private static const PAGE5:String = "Page5"; 
		private static const PAGE6:String = "PAGE6"; 
		
		private var nav:ScreenNavigator; 
		public function Main()
		{
			addEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 
		}
		
		private function Init(e:starling.events.Event):void
		{
			var bgBitmap:Bitmap = new bg(); 
			bgTexture =  Texture.fromBitmap(bgBitmap, true); 
			var bgImage = new Image(bgTexture); 
			addChild(bgImage);
			
			//var theme:MetalWorksMobileTheme = new MetalWorksMobileTheme (stage); 
			nav = new ScreenNavigator(); 
			addChild(nav); 
			var transition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(nav);  

			var pg1:ScreenNavigatorItem = new ScreenNavigatorItem(Page1, {forwardBtn:PAGE2}, null); 
			var pg2:ScreenNavigatorItem = new ScreenNavigatorItem(Page2, {forwardBtn:PAGE3, backBtn:PAGE1}, null); 
			var pg3:ScreenNavigatorItem = new ScreenNavigatorItem(Page3, {forwardBtn:PAGE4, backBtn:PAGE2}, null); 
			var pg4:ScreenNavigatorItem = new ScreenNavigatorItem(Page4, {forwardBtn:PAGE5, backBtn:PAGE3}, null); 
			var pg5:ScreenNavigatorItem = new ScreenNavigatorItem(Page5, {forwardBtn:PAGE6, backBtn:PAGE4}, null); 
			var pg6:ScreenNavigatorItem = new ScreenNavigatorItem(Page6, {backBtn:PAGE5}, null); 
		
			nav.addScreen(PAGE1, pg1); 
			nav.addScreen(PAGE2, pg2); 
			nav.addScreen(PAGE3, pg3); 
			nav.addScreen(PAGE4, pg4); 
			nav.addScreen(PAGE5, pg5); 
			nav.addScreen(PAGE6, pg6); 
			nav.showScreen(PAGE1); 
			
	
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 

	}
	
		

	}
}