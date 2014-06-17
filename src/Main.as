package
{


	import flash.display.Bitmap;
	import flash.events.TimerEvent;
	import flash.text.TextFormat;
	import flash.text.nextText;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	
	import feathers.controls.Button;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.controls.text.TextFieldnextText;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;

	public class Main extends Sprite
	{
		[Embed(source="./assets/background.png")]
		private var bg:Class; 
		private var bgTexture:Texture; 

		[Embed(source="./assets/next.png")]
		public static var Forward:Class; 
		
		[Embed(source="./assets/back.png")]
		public static var Back:Class; 
		
		[Embed(source="./assets/MinionPro-SemiboldIt.otf", embedAsCFF="false", fontName="MinionSemiBoldItalics", fontFamily="Minion",unicodeRange = "U+0020-U+007e")]
		private static const MinionSemiBoldItalics:Class; 
		
		private  var forwardBtnTexture:Texture; 
		private  var fbtn:Button; 
		
		private  var backBtnTexture:Texture; 
		private  var backbtn:Button; 
		
		private  var fBitmap:Bitmap; 
		private  var bBitmap:Bitmap; 
		
		private var fBtnText:TextField; 
		private var backBtnText;TextField; 
		
		private static const PAGE1:String = "Page1"; 
		private static const PAGE2:String = "Page2"; 
		private static const PAGE3:String = "Page3"; 
		private static const PAGE4:String = "Page4"; 
		private static const PAGE5:String = "Page5"; 
		private static const PAGE6:String = "PAGE6"; 
		
		private var nav:ScreenNavigator; 
		public var pg1:ScreenNavigatorItem; 
		public var pg2:ScreenNavigatorItem; 
		public var pg3:ScreenNavigatorItem; 
		public var pg4:ScreenNavigatorItem; 
		public var pg5:ScreenNavigatorItem; 
		public var pg6:ScreenNavigatorItem; 
		
		private var currentPage:String; 
		private var previousPage:String; 
		public var Page1Screen:Page1; 
		public var Page2Screen:Page2; 
		public var Page3Screen:Page3; 
		public var Page4Screen:Page4; 
		public var Page5Screen:Page5; 
		public var Page6Screen:Page6; 
	
		//fade states 
		public var fadeBackUp:Boolean; 
		public var fadeNextUp:Boolean; 
		public var fadeBackDown:Boolean; 
		public var fadeNextDown:Boolean; 

		private var fadeTime:Number = 0.8;
		public static var greyColor:uint= 0x282828; 
		
		private var nextText:TextFieldTextRenderer
		private var backText:TextFieldTextRenderer
		private var container:Sprite; 
		
		//boolean to check for interativity and timer 
		private var time:Timer; 

		
		public function Main()
		{
			addEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 

		}
		
		private function Init(e:starling.events.Event):void
		{
			container = new Sprite();
			Page1Screen = new Page1(); 
			Page2Screen = new Page2(); 
			Page3Screen = new Page3(); 
			Page4Screen = new Page4(); 
			Page5Screen = new Page5(); 
			Page6Screen = new Page6(); 
			Mouse.hide(); 
			var bgBitmap:Bitmap = new bg(); 
			bgTexture =  Texture.fromBitmap(bgBitmap, true); 
			var bgImage = new Image(bgTexture); 
			bgImage.width= stage.stageWidth; 
			bgImage.height = stage.stageHeight ; 
			addChild(bgImage);
			
			//var theme:MetalWorksMobileTheme = new MetalWorksMobileTheme (stage); 
			nav = new ScreenNavigator(); 
			container.addChild(nav); 
			var transition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(nav);  
			transition.duration = 0.6;
			//transition.ease = Transitions.EASE_IN; 

			 pg1 = new ScreenNavigatorItem(Page1Screen, {forwardBtn:PAGE2}, null); 
			 pg2 = new ScreenNavigatorItem(Page2Screen, {forwardBtn:PAGE3, backBtn:PAGE1}, null); 
			 pg3 = new ScreenNavigatorItem(Page3Screen, {forwardBtn:PAGE4, backBtn:PAGE2}, null); 
			 pg4 = new ScreenNavigatorItem(Page4Screen, {forwardBtn:PAGE5, backBtn:PAGE3}, null); 
			 pg5 = new ScreenNavigatorItem(Page5Screen, {forwardBtn:PAGE6, backBtn:PAGE4}, null); 
			 pg6 = new ScreenNavigatorItem(Page6Screen, {backBtn:PAGE5}, null); 
		
			nav.addScreen(PAGE1, pg1); 
			nav.addScreen(PAGE2, pg2); 
			nav.addScreen(PAGE3, pg3); 
			nav.addScreen(PAGE4, pg4); 
			nav.addScreen(PAGE5, pg5); 
			nav.addScreen(PAGE6, pg6); 
			nav.showScreen(PAGE1); 
			
		
			//words for butttons 
			nextText = new TextFieldTextRenderer();
			nextText.textFormat = new TextFormat( "MinionSemiBoldItalics", 21.88, Main.greyColor );
			nextText.embedFonts = true; 
			nextText.text = "Next"; 
			nextText.x = 1238; 
			nextText.y = 759;
			container.addChild(nextText); 
			
			backText = new TextFieldTextRenderer();
			backText.textFormat = new TextFormat( "MinionSemiBoldItalics", 21.88, Main.greyColor );
			backText.embedFonts = true; 
			backText.text = "Previous"; 
			backText.x = 149; 
			backText.y = 759;
			backText.alpha = 0; 
			container.addChild(backText); 
			
			//btns 
			fBitmap = new Forward(); 
			forwardBtnTexture = Texture.fromBitmap(fBitmap, true); 
			fbtn = new Button(); 
			fbtn.defaultSkin = new Image(forwardBtnTexture); 
			fbtn.x = 1183; 
			fbtn.y =740; 
			fbtn.addEventListener( Event.TRIGGERED, ftriggered);
			container.addChild(fbtn);
			fbtn.isSelected = false;
	
			var bBitmap:Bitmap = new Back(); 
			backBtnTexture = Texture.fromBitmap(bBitmap, true); 
			backbtn = new Button(); 
			backbtn.defaultSkin = new Image(backBtnTexture); 
			backbtn.x = 50; 
			backbtn.y = 740; 
			backbtn.addEventListener( Event.TRIGGERED, btriggered);
		
			container.addChild(backbtn);
			trace(container.width +" " + stage.stageWidth);
			container.x =0;
			container.y =0; 
			container.x = ((stage.stageWidth - container.width)/4); 
			container.y = (stage.stageHeight - container.height)/4; 

			addChild(container);
			backbtn.isSelected = false;
			backbtn.alpha = 0; 
			currentPage = PAGE1;    
			

			
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, Init); 
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame); 
			
			//timer kick off 
			//time = new Timer (270000);
			//debug timer
			time = new Timer (3000);
			time.start();
			time.addEventListener(TimerEvent.TIMER, checkForUser); 
	}
		
		private function checkForUser (e:TimerEvent):void
		{
				nav.showScreen(PAGE1); 
				currentPage = PAGE1; 
			
		}
		
		public function onEnterFrame(event:EnterFrameEvent):void
		{
			if(fadeBackUp)
			{
				var tween:Tween = new Tween(backbtn,fadeTime); 
				tween.fadeTo(1); 
				var tween2:Tween = new Tween(backText, fadeTime); 
				tween2.fadeTo(1); 
				Starling.juggler.add(tween);
				Starling.juggler.add(tween2); 
				tween.onComplete = function():void { fadeBackUp =false }
				
			}
			if(fadeBackDown)
			{
				var tween:Tween = new Tween(backbtn, fadeTime); 
				var tween2:Tween = new Tween(backText, fadeTime);
				tween.fadeTo(0); 
				tween2.fadeTo(0); 
				Starling.juggler.add(tween);
				Starling.juggler.add(tween2);
				tween.onComplete = function():void { fadeBackDown =false }
			}
			
			if(fadeNextUp)
			{
				var tween:Tween = new Tween(fbtn,fadeTime); 
				tween.fadeTo(1); 
				var tween2:Tween = new Tween(nextText, fadeTime); 
				tween2.fadeTo(1); 
				Starling.juggler.add(tween);
				Starling.juggler.add(tween2); 
				tween.onComplete = function():void { fadeNextUp =false }
			}
			if(fadeNextDown)
			{
				var tween:Tween = new Tween(fbtn, fadeTime); 
				var tween2:Tween = new Tween(nextText, fadeTime); 
				tween.fadeTo(0); 
				tween2.fadeTo(0); 
				Starling.juggler.add(tween);
				Starling.juggler.add(tween2);
				tween.onComplete = function():void { fadeNextDown =false }
			}
			
		}
		public function btriggered(e:Event):void
		{	
			time.reset();
			time.start();
			dispatchEventWith("forwardBtn", false); 
			if(currentPage == PAGE2) 
			{
				nav.showScreen(PAGE1);
				currentPage = PAGE1; 
				fadeBackDown = true; 
			}
				
			else if(currentPage == PAGE3) 
			{
				nav.showScreen(PAGE2);
				currentPage = PAGE2; 
				
			}
				
			else if(currentPage == PAGE4) 
			{
				nav.showScreen(PAGE3);
				currentPage = PAGE3; 
			}
				
			else if(currentPage == PAGE5) 
			{
				nav.showScreen(PAGE4);
				currentPage = PAGE4; 
			}
			else if(currentPage == PAGE6) 
			{
				nav.showScreen(PAGE5);
				currentPage = PAGE5; 
				fadeNextUp = true; 
			}
			
			
		}
		
		private function ftriggered(e:Event):void
		{
			time.reset();
			time.start();
			//dispatchEventWith("forwardBtn", false); 
			
			//write if statements here 
			if(currentPage == PAGE1)
			{
				nav.showScreen(PAGE2);
				currentPage = PAGE2; 
				fadeBackUp =true;
			}
			else if(currentPage == PAGE2) 
			{
				nav.showScreen(PAGE3);
				currentPage = PAGE3; 
			}
			
			else if(currentPage == PAGE3) 
			{
				nav.showScreen(PAGE4);
				currentPage = PAGE4; 
			}
			
			else if(currentPage == PAGE4) 
			{
				nav.showScreen(PAGE5);
				currentPage = PAGE5; 
			}
			
			else if(currentPage == PAGE5) 
			{
				nav.showScreen(PAGE6);
				currentPage = PAGE6; 
				fadeNextDown= true;
			}
		 
		}
	
		

	}
}