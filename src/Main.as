package
{


	import flash.display.Bitmap;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	
	import starling.animation.Transitions;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	import flash.ui.Mouse;
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
		public var pg1:ScreenNavigatorItem; 
		public var pg2:ScreenNavigatorItem; 
		public var pg3:ScreenNavigatorItem; 
		public var pg4:ScreenNavigatorItem; 
		public var pg5:ScreenNavigatorItem; 
		public var pg6:ScreenNavigatorItem; 
		
		public function Main()
		{
			addEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 
			Mouse.hide(); 
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
			transition.duration = 0.6;
			//transition.ease = Transitions.EASE_IN; 

			 pg1 = new ScreenNavigatorItem(Page1, {forwardBtn:PAGE2}, null); 
			 pg2 = new ScreenNavigatorItem(Page2, {forwardBtn:PAGE3, backBtn:PAGE1}, null); 
			 pg3 = new ScreenNavigatorItem(Page3, {forwardBtn:PAGE4, backBtn:PAGE2}, null); 
			 pg4 = new ScreenNavigatorItem(Page4, {forwardBtn:PAGE5, backBtn:PAGE3}, null); 
			 pg5 = new ScreenNavigatorItem(Page5, {forwardBtn:PAGE6, backBtn:PAGE4}, null); 
			 pg6 = new ScreenNavigatorItem(Page6, {backBtn:PAGE5}, null); 
		
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