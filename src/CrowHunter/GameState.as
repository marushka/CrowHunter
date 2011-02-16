package CrowHunter 
{
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import shapes.Circle;
	/**
	 * ...
	 * @author art
	 */
	public class GameState extends State 
	{
		private var level:Level1;
		private var m_timer:Timer;
		private var m_complForm:LevelComplete;
		
		public function GameState() 
		{
			level = new Level1();
			addChild(level);
			level.addDoneListener(OnDoneLevel);
		}
	
		
		public override function RemoveListerens():void
		{
			
		}
		
		public override function AddListerens():void
		{
			m_complForm = new LevelComplete();
			m_complForm.buttonNext.addEventListener(MouseEvent.CLICK, onNextClick);
		}
		
		private function OnDoneLevel():void
		{
			m_complForm.x = (this.width - m_complForm.width) / 2;
			m_complForm.y = (this.height - m_complForm.height) / 2;
			addChild(m_complForm);
		}
		
		private function onNextClick(e:Event):void
		{
			OnDone();
		}
	}

}