package
{
	import flash.display.Bitmap;
	import flash.text.StaticText;
	
	import feathers.controls.Button;
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class Page1 extends Screen
	{
		[Embed(source="./assets/01.png")]
		private  var Page1Asset:Class; 
		
		[Embed(source="./assets/next.png")]
		private var Forward:Class; 
		
		private var pgBitmap:Bitmap; 
		
		private var Page1Texture:Texture; 
		
		private var forwardBtnTexture:Texture; 
		private var fbtn:Button; 
		private var pgTexture:Texture; 
		private var pgImage:Image; 
		public function Page1()
		{
			
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			pgBitmap = new Page1Asset();
			pgTexture = Texture.fromBitmap(pgBitmap, true); 
			pgImage = new Image(pgTexture); 
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
			deleteObjects();
			
		}
		
		private function deleteObjects():void
		{
			trace("deleting page2"); 
		//	forwardBtnTexture.dispose(); 
			//fbtn.removeFromParent(true);
			pgTexture.dispose(); 
			//pgImage.removeFromParent(true);
		
			//backbtn.removeFromParent(true); 
		}
		
	}
}