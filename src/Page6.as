package
{
	import flash.display.Bitmap;
	
	import feathers.controls.Screen;
	
	import starling.display.Image;
	import starling.display.Quad;
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
		
		[Embed(source="./assets/tombstone.png")]		
		private var tombBitmap:Class; 
		private var tombTexture:Texture; 
		private var tombImage:Image; 
		
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
			
			var rect:Quad = new Quad(449,295, 0x90a5b8, true); 
			rect.x = 757; 
			rect.y = 336;
			rect.alpha = .8; 
			addChild(rect);
			
			
			var tombBits:Bitmap = new tombBitmap(); 
			tombTexture = Texture.fromBitmap(tombBits, true); 
			tombImage = new Image(tombTexture); 
			tombImage.x = 757; 
			tombImage.y = 336; 
			addChild(tombImage); 	
		

		}
		
	}
}
