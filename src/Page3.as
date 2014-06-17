package
{
	import flash.display.Bitmap;
	
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Page3 extends Screen
	{
		[Embed(source="./assets/03.png")]
		private var Page3Asset:Class;
		
		
		[Embed(source="./assets/MinionPro-Semibold.otf", embedAsCFF="false", fontName="MinionSemiBold", fontFamily="Minion", unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBold:Class; 
		
		public var tombStone:String;
		public var tombstoneField:starling.text.TextField; 
		
		private var pgBitmap:Bitmap; 
		private var pgTexture:Texture; 
		private var pgImage:Image; 
		public function Page3()
		{
			
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			pgBitmap = new Page3Asset();
			pgTexture = Texture.fromBitmap(pgBitmap, true); 
			pgImage = new Image(pgTexture); 
			addChild(pgImage); 
			trace("page3made"); 


			tombStone = "Our Chinese Wall, Citizens Committee To Repeal Chinese Exclusion, New York, 1943";
			tombstoneField = new TextField(725, 24, tombStone, "MinionSemiBold", 20.83, 0x282828); 
			tombstoneField.vAlign = VAlign.TOP; 
			tombstoneField.hAlign = HAlign.CENTER; 
			tombstoneField.x = 284; 
			tombstoneField.y = 837; 
			addChild(tombstoneField); 
			
		}
		
	}
}
