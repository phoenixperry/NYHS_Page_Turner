package
{


	import flash.display.Bitmap;
	import flash.geom.Point;
	
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
		
		public function Main()
		{
			addEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 
		}
		
		private function Init(e:starling.events.Event):void
		{
			
		
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 
			addEventListener(starling.events.Event.ENTER_FRAME, gameLoop); 
			
			var bgBitmap:Bitmap = new bg(); 
			bgTexture =  Texture.fromBitmap(bgBitmap, true); 
			var bgImage = new Image(bgTexture); 
			addChild(bgImage); 
			
		}
		
		private function gameLoop():void
		{
			// TODO Auto Generated method stub
			
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