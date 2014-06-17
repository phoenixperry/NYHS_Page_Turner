package
{
	import flash.display.Bitmap;

	import feathers.controls.Screen;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Page1 extends Screen
	{
		[Embed(source="./assets/01.png")]
		private  var Page1Asset:Class; 
		
		[Embed(source="./assets/MinionPro-SemiboldIt.otf", embedAsCFF="false", fontName="MinionSemiBoldItalics", fontFamily="Minion",unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBoldItalics:Class; 
		
		[Embed(source="./assets/MinionPro-Regular.otf", embedAsCFF="false", fontName="MinionRegular", fontFamily="Minion",unicodeRange = "U+0020-U+007e")]
		private static const MinionRegular:Class; 
		
		[Embed(source="./assets/MinionPro-Semibold.otf", embedAsCFF="false", fontName="MinionSemiBold", fontFamily="Minion", unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBold:Class; 
		
		private var pgBitmap:Bitmap; 
		public var Page1Texture:Texture; 
		public var pgTexture:Texture; 
		public var pgImage:Image; 
		public var textfield:TextField; 
		public var datefield: TextField; 
		public var bodyfield:TextField;
		public var tombstoneField:TextField; 
		public var ourChineseWall:String; 
		public var excerpt:String;
		public var bodyText:String; 
		public var tombStone:String;
		
		
		public function Page1()
		{
			
			
			
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
			trace("page 1 made"); 
			
			var rect:Quad = new Quad(449,485, 0x90a5b8, true); 
			rect.x = 257; 
			rect.y = 226;
			addChild(rect);
			
			
			ourChineseWall = "Our Chinese Wall,";
			textfield = new TextField(392, 554, ourChineseWall, "MinionSemiBoldItalics", 37.5, Main.greyColor); 
			textfield.vAlign = VAlign.TOP; 
			textfield.hAlign = HAlign.RIGHT;
			textfield.x = 287; 
			textfield.y = 265; 
			addChild(textfield);
			
			excerpt = "excerpt, 1943";
			datefield = new TextField(392, 554, excerpt, "MinionSemiBold", 37.5, Main.greyColor); 
			datefield.vAlign = VAlign.TOP; 
			datefield.hAlign = HAlign.RIGHT; 
			datefield.x = 287; 
			datefield.y = 313; 
			addChild(datefield); 
			
			bodyText = "The Citizens Committee to Repeal Chinese Exclusion distributed"+"\n"+ "more than 30,000 copies of this pamphlet to clubs, libraries, labor unions, religious organizations, and the press. Their efforts put the repeal of Chinese Exclusion on" + "\n"+"the national agenda.";
			bodyfield = new TextField(392, 570, bodyText, "MinionRegular", 27.3, Main.greyColor); 
			bodyfield.vAlign = VAlign.TOP; 
			bodyfield.hAlign = HAlign.RIGHT; 
			bodyfield.x = 287; 
			bodyfield.y = 388; 
			addChild(bodyfield); 
			
			
			tombStone = "Our Chinese Wall, Courtesy of Pearl Buck House";
			tombstoneField = new TextField(413, 24, tombStone, "MinionSemiBold", 20.83, Main.greyColor); 
			tombstoneField.vAlign = VAlign.TOP; 
			tombstoneField.hAlign = HAlign.CENTER; 
			tombstoneField.x = 735; 
			tombstoneField.y = 837; 
			addChild(tombstoneField); 
			
			
			pgBitmap = new Page1Asset();
			pgTexture = Texture.fromBitmap(pgBitmap, true); 
			pgImage = new Image(pgTexture); 
			addChild(pgImage); 
			
		}
	
		
	}
}