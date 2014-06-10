package
{


	import flash.display.Bitmap;
	import flash.geom.Point;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.controls.TextArea;
	import feathers.data.ListCollection;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.Stats;
	
	public class Main extends Sprite
	{
		[Embed(source="./assets/background.png")]
		private var bg:Class; 
		
		
		
		private var bgTexture:Texture; 


	 
		
		private var pgBitmaps:Vector.<Bitmap>; 
		private var pages:Vector.<Image>; 
		
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
	
		
		private function onTouch (e:TouchEvent):void
		{
			// get the mouse location related to the stage
			var touch:Touch = e.getTouch(stage);
			var pos:Point = touch.getLocation(stage);
			
			//position whatever you need to here - check for clicks whatever 
			//note feathers might handle this. explore more
		}
	}
}