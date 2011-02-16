package CrowHunter 
{
	/**
	 * ...
	 * @author art
	 */
	public class LevelMap 
	{
		private var m_levelsMask:Array;
		
		public function get LevelsMask():Array
		{
			return m_levelsMask;
		}
		
		public function LevelMap() 
		{
			m_levelsMask = new Array();
			m_levelsMask[0] = true;
			for(var i:int = 1; i < 30; ++i)
			{
				m_levelsMask[i] = false;
			}
		}
		
	}

}