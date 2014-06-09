package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.display.*;
	import starling.core.Starling;
	
	[SWF(width="1440", height = "900", frameRate="60", background ="#000000"] 
	public class NYHS_Page_Turner extends Sprite
	{
		protected var st:Starling; 
		public function NYHS_Page_Turner()
		{
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