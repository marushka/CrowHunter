package CrowHunter 
{
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Rockelk Game Lab
	 */
	public class MapState extends State 
	{
		
		private var m_form:Map;
		private var m_levelMap:LevelMap;
		
		public function MapState() 
		{
			m_form = new Map();
			addChild(m_form);
			m_levelMap = new LevelMap();
			InitMapButtons();

		}
		
		public override function RemoveListerens():void
		{
			//form.m_button1.removeEventListener(MouseEvent.CLICK, OnClick);
			m_form.m_button1.removeEventListener(MouseEvent.CLICK, OnClick1);
			m_form.m_button2.removeEventListener(MouseEvent.CLICK, OnClick2);
			m_form.m_button3.removeEventListener(MouseEvent.CLICK, OnClick3);
			m_form.m_button4.removeEventListener(MouseEvent.CLICK, OnClick4);
			m_form.m_button5.removeEventListener(MouseEvent.CLICK, OnClick5);
		}
		
		public override function AddListerens():void
		{
			m_form.m_button1.gotoAndStop("Enabled");
			m_form.m_button2.gotoAndStop("Locked");
			m_form.m_button3.gotoAndStop("Locked");
			m_form.m_button4.gotoAndStop("Locked");
			m_form.m_button5.gotoAndStop("Locked");
			m_form.m_button1.addEventListener(MouseEvent.CLICK, OnClick1);
			/*m_form.m_button1.addEventListener(MouseEvent.CLICK, OnClick2);
			m_form.m_button1.addEventListener(MouseEvent.CLICK, OnClick3);
			m_form.m_button1.addEventListener(MouseEvent.CLICK, OnClick4);
			m_form.m_button1.addEventListener(MouseEvent.CLICK, OnClick5);*/
			
		}
		
		private function OnClick1(event:MouseEvent):void
		{
			OnDone();
		}
		
		private function OnClick2(event:MouseEvent):void
		{
			OnDone();
		}
		
		private function OnClick3(event:MouseEvent):void
		{
			OnDone();
		}
		
		private function OnClick4(event:MouseEvent):void
		{
			OnDone();
		}
		
		private function OnClick5(event:MouseEvent):void
		{
			OnDone();
		}
		
		
		
		private function InitMapButtons():void
		{
			if(m_form)
			{
				
			}
		}
		
	}

}