package
{
	import flash.display.Bitmap;
	
	import feathers.controls.Button;
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class Page1 extends Screen
	{
		[Embed(source="./assets/01.png")]
		private var Page1Asset:Class; 
		
		[Embed(source="./assets/next.png")]
		private var Forward:Class; 
		
		
		private var Page1Texture:Texture; 
		
		private var forwardBtnTexture; 
		private var fbtn:Button; 
	
		
		public function Page1()
		{
			
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			var pgBitmap:Bitmap = new Page1Asset();
			var pgTexture:Texture = Texture.fromBitmap(pgBitmap, true); 
			var pgImage:Image = new Image(pgTexture); 
			addChild(pgImage); 
			
			var fBitmap:Bitmap = new Forward(); 
			forwardBtnTexture = Texture.fromBitmap(fBitmap, true); 
			fbtn = new Button(); 
			fbtn.defaultSkin = new Image(forwardBtnTexture); 
			fbtn.x = 1226; 
			fbtn.y = 735; 
			fbtn.addEventListener( Event.TRIGGERED, triggered);
			//fbtn.addEventListener( Event.CHANGE, triggered );
			addChild(fbtn);
			fbtn.isSelected = false;

			
		}
		
		private function triggered(e:Event):void
		{
			dispatchEventWith("forwardBtn", false); 
			trace( "button.isSelected has changed:", fbtn.isSelected );
			
		}
		
	}
}