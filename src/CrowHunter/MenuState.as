package CrowHunter 
{
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Rockelk Game Lab
	 */
	public class MenuState extends State 
	{
		private var form:form1;
		
		public function MenuState() 
		{
			form = new form1();
			addChild(form);
			form.m_button1.addEventListener(MouseEvent.CLICK, OnClick);
		}
		
		private function OnClick(event:MouseEvent):void
		{
			OnDone();
		}
		
		public override function AddListerens():void
		{
		}
		
		public override function RemoveListerens():void
		{
			form.m_button1.removeEventListener(MouseEvent.CLICK, OnClick);
		}
		
		
		
		
	}

}