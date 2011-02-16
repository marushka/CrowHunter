package 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
	import asunit.textui.TestRunner;
	
	import CrowHunter.*;

	
	/**
	 * ...
	 * @author Rockelk Game Lab
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			var sm:StateMachine = new StateMachine();
			addChild(sm);
		
			
			
			
			
			/*var unittests:TestRunner = new TestRunner();
			stage.addChild(unittests);
			unittests.start(AllTests, null, TestRunner.SHOW_TRACE);*/
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}