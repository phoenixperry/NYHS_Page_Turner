package
{
	import feathers.controls.Screen;
	import flash.display.Bitmap;
	
	import feathers.controls.Button;
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class Page4 extends Screen
	{
		[Embed(source="./assets/04.png")]
		private var Page4Asset:Class; 
		
		
		[Embed(source="./assets/next.png")]
		public var Forward:Class; 
		
		[Embed(source="./assets/back.png")]
		public var Back:Class; 
		
		
		private var forwardBtnTexture; 
		private var fbtn:Button; 
		
		private var backBtnTexture; 
		private var backbtn:Button;
		public function Page4()
		{
			super();
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			var pgBitmap:Bitmap = new Page4Asset();
			var pgTexture:Texture = Texture.fromBitmap(pgBitmap, true); 
			var pgImage:Image = new Image(pgTexture); 
			addChild(pgImage); 
			
			var fBitmap:Bitmap = new Forward(); 
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
			
		}
		
		private function ftriggered(e:Event):void
		{
			dispatchEventWith("forwardBtn", false); 
			trace( "button.isSelected has changed:", fbtn.isSelected );
			
		}
		
	}
}
