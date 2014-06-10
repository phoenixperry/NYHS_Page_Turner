package
{
	import flash.display.Bitmap;
	import flash.text.StaticText;
	
	import feathers.controls.Button;
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;

	public class Page2 extends Screen
	{
		[Embed(source="./assets/02.png")]
		private static var Page2Asset:Class; 
		

		[Embed(source="./assets/next.png")]
		public static var Forward:Class; 
		
		[Embed(source="./assets/back.png")]
		public static var Back:Class; 


		private  var forwardBtnTexture:Texture; 
		private  var fbtn:Button; 
		
		private  var backBtnTexture:Texture; 
		private  var backbtn:Button; 
		
		private  var fBitmap:Bitmap; 
		private  var bBitmap:Bitmap; 
		private  var pgBitmap:Bitmap; 
		private  var pgTexture:Texture; 
		private var pgImage:Image; 
		public function Page2()
		{
		
		}
		
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			pgBitmap = new Page2Asset();
			pgTexture = Texture.fromBitmap(pgBitmap, true); 
			pgImage = new Image(pgTexture); 
			addChild(pgImage); 
			
			fBitmap = new Forward(); 
			forwardBtnTexture = Texture.fromBitmap(fBitmap, true); 
			fbtn = new Button(); 
			fbtn.defaultSkin = new Image(forwardBtnTexture); 
			fbtn.x = 1226; 
			fbtn.y = 735; 
			fbtn.addEventListener( Event.TRIGGERED, ftriggered);
			//fbtn.addEventListener( Event.CHANGE, triggered );
			addChild(fbtn);
			fbtn.isSelected = false;
			
			var bBitmap:Bitmap = new Back(); 
			backBtnTexture = Texture.fromBitmap(bBitmap, true); 
			backbtn = new Button(); 
			backbtn.defaultSkin = new Image(backBtnTexture); 
			backbtn.x = 38; 
			backbtn.y = 735; 
			backbtn.addEventListener( Event.TRIGGERED, btriggered);
			//fbtn.addEventListener( Event.CHANGE, triggered );
			addChild(backbtn);
			backbtn.isSelected = false;
			
			
		}
		
		private function btriggered(e:Event):void
		{
			dispatchEventWith("backBtn", false); 
			deleteObjects(); 
		}
		
		private function ftriggered(e:Event):void
		{
			dispatchEventWith("forwardBtn", false); 
			trace( "button.isSelected has changed:", fbtn.isSelected );
			deleteObjects(); 
		}
		
		private function deleteObjects():void
		{
			trace("deleting page2"); 
			//forwardBtnTexture.dispose(); 
			//fbtn.removeFromParent(true);
			pgTexture.dispose(); 
			//pgImage.removeFromParent(true);
			//backBtnTexture.dispose(); 
			//backbtn.removeFromParent(true); 
		}
		
	}
}
