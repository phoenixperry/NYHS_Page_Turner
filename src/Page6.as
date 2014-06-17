package
{
	import flash.display.Bitmap;
	
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Page6 extends Screen
	{
		[Embed(source="./assets/06.png")]
		private var Page6Asset:Class;
		
		[Embed(source="./assets/MinionPro-Semibold.otf", embedAsCFF="false", fontName="MinionSemiBold", fontFamily="Minion", unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBold:Class; 
		
		public var tombStone:String;
		public var tombstoneField:starling.text.TextField; 
		
		private var pgBitmap:Bitmap; 
		private var pgTexture:Texture; 
		private var pgImage:Image; 
		public function Page6()
		{
			
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			pgBitmap = new Page6Asset();
			pgTexture = Texture.fromBitmap(pgBitmap, true); 
			pgImage = new Image(pgTexture); 
			addChild(pgImage); 
			trace("page6made"); 
			
			tombStone = "Our Chinese Wall, Courtesy of Pearl Buck House";
			tombstoneField = new TextField(413, 24, tombStone, "MinionSemiBold", 20.83, Main.greyColor); 
			tombstoneField.vAlign = VAlign.TOP; 
			tombstoneField.hAlign = HAlign.LEFT; 
			tombstoneField.x = 284; 
			tombstoneField.y = 837; 
			addChild(tombstoneField); 

		}
		
	}
}
