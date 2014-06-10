package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.ui.Mouse;
	
	import starling.core.Starling;

	[SWF(width="1440", height = "900", frameRate="60", backgroundColor ="#000000"] 
	public class NYHS_Page_Turner extends Sprite
	{
		protected var st:Starling; 
		public function NYHS_Page_Turner()
		{ 
			Mouse.hide();
			st = new Starling(Main, stage); 
			st.start(); 
			goFullScreen(); 
	
		}
		
		private function goFullScreen():void
		{
			stage.displayState = StageDisplayState.FULL_SCREEN; 			
		}
	}
}