package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
	import starling.core.Starling;
	import starling.events.ResizeEvent;
	import starling.utils.AssetManager;

//
	[SWF(width="1440", height = "900", frameRate="60", backgroundColor ="#000000"] 
	
	
	public class NYHS_Page_Turner extends Sprite
	{
		protected var st:Starling; 
		
		[Embed(source="./assets/background.png")]
		private var myBitmap:Class; 
			
		public function NYHS_Page_Turner()
		{ 
			Mouse.hide();

			
		//	var viewPort:Rectangle =  new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
//			var screenWidth:int  = stage.fullScreenWidth;
//			var screenHeight:int = stage.fullScreenHeight;
//			var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight)
//			screenWidth = stage.fullScreenWidth  > 1440 ? 1440 : stage.fullScreenWidth;
//			screenHeight = stage.fullScreenHeight > 900 ? 900  : stage.fullScreenHeight;

			stage.align= StageAlign.TOP_LEFT; 	
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			st = new Starling(Main, stage);
			
			stage.addEventListener(ResizeEvent.RESIZE, resizeStage);				
			st.start(); 

		}
		private function resizeStage(e:Event) {
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
			Starling.current.viewPort = viewPortRectangle;
			
			st.stage.stageWidth = stage.stageWidth;
			st.stage.stageHeight = stage.stageHeight;
			goFullScreen(); 
		
		}
		private function goFullScreen():void
		{
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;		
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align= StageAlign.TOP_LEFT; 	
			//stage.align = "";
		}
	}
}