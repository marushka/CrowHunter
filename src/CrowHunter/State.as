package CrowHunter 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rockelk Game Lab
	 */
	public class State extends Sprite
	{
		private var m_listener:Function;
		
		public function State() 
		{
			
		}
		
		public function addDoneListener(listener:Function):void
		{
			m_listener = listener;
		}
		
		public function OnDone():void
		{
			if(null != m_listener)
			{
				m_listener.apply();
			}
		}
		
		public function AddListerens():void
		{
			
		}
		
		public function RemoveListerens():void
		{
			
		}
		
	}

}