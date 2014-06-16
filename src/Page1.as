package
{
	import flash.display.Bitmap;

	
	import feathers.controls.Button;
	import feathers.controls.Screen;

	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Page1 extends Screen
	{
		[Embed(source="./assets/01.png")]
		private  var Page1Asset:Class; 
		
		[Embed(source="./assets/next.png")]
		private var Forward:Class; 
		
		[Embed(source="./assets/MinionPro-SemiboldIt.otf", embedAsCFF="false", fontName="MinionSemiBoldItalics", fontFamily="Minion",unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBoldItalics:Class; 
		
		[Embed(source="./assets/MinionPro-Regular.otf", embedAsCFF="false", fontName="MinionRegular", fontFamily="Minion",unicodeRange = "U+0020-U+007e")]
		private static const MinionRegular:Class; 
		
		[Embed(source="./assets/MinionPro-Semibold.otf", embedAsCFF="false", fontName="MinionSemiBold", fontFamily="Minion", unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBold:Class; 
		
		private var pgBitmap:Bitmap; 
		
		private var Page1Texture:Texture; 
		
		private var forwardBtnTexture:Texture; 
		private var fbtn:Button; 
		private var pgTexture:Texture; 
		private var pgImage:Image; 
		private var textfield:TextField; 

		
		private var datefield: TextField; 

		
		private var bodyfield:TextField; 

		
		private var tombstoneField:TextField; 

		
		private var ourChineseWall:String; 
		private var excerpt:String;
		private var bodyText:String; 
		private var tombStone:String; 
		
		
		public function Page1()
		{
			
			
			
		}
		override protected function draw():void
		{
			
		}
		override protected function initialize():void
		{
		
			
			var rect:Quad = new Quad(449,485, 0x90a5b8, true); 
			rect.x = 257; 
			rect.y = 226;
			addChild(rect);
			
			
			ourChineseWall = "Our Chinese Wall,";
			textfield = new TextField(392, 554, ourChineseWall, "MinionSemiBoldItalics", 37.5, Color.BLACK); 
			textfield.vAlign = VAlign.TOP; 
			textfield.hAlign = HAlign.RIGHT;
			textfield.x = 287; 
			textfield.y = 265; 
			addChild(textfield);
			
			excerpt = "excerpt, 1943";
			datefield = new TextField(392, 554, excerpt, "MinionSemiBold", 37.5, Color.BLACK); 
			datefield.vAlign = VAlign.TOP; 
			datefield.hAlign = HAlign.RIGHT; 
			datefield.x = 287; 
			datefield.y = 313; 
			addChild(datefield); 
			
			bodyText = "The Citizens Committee to Repeal Chinese Exclusion distributed more than 30,000 copies of this pamphlet to clubs, libraries, labor unions, religious organizations, and the press. Their efforts put the repeal of Chinese Exclusion on the national agenda.";
			bodyfield = new TextField(392, 554, bodyText, "MinionRegular", 25, Color.BLACK); 
			bodyfield.vAlign = VAlign.TOP; 
			bodyfield.hAlign = HAlign.RIGHT; 
			bodyfield.x = 287; 
			bodyfield.y = 388; 
			addChild(bodyfield); 
			
			
			tombStone = "Our Chinese Wall, Courtesy of Pearl Buck House";
			tombstoneField = new TextField(413, 24, tombStone, "MinionSemiBold", 20.83, Color.BLACK); 
			tombstoneField.vAlign = VAlign.TOP; 
			tombstoneField.hAlign = HAlign.CENTER; 
			tombstoneField.x = 735; 
			tombstoneField.y = 837; 
			addChild(tombstoneField); 
			
			
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
			tombstoneField.dispose(); 
			bodyfield.dispose(); 
			datefield.dispose(); 
			textfield.dispose(); 
			//pgImage.removeFromParent(true);
		
			//backbtn.removeFromParent(true); 
		}
		
	}
}