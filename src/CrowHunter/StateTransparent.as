package CrowHunter 
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author art
	 */
	public class StateTransparent
	{
		private var m_timer:Timer;
		private var m_stateFrom:State;
		private var m_stateTo:State;
		private var m_onDone:Function;
		private var m_delay:Number;
		private var m_repeatCounter:int;
		
		public function StateTransparent(stateFrom:State, stateTo:State, onDone:Function, delay:Number, repeatCount:int):void
		{
			m_stateFrom = stateFrom;
			m_stateTo = stateTo;
			m_onDone = onDone;
			m_delay = delay;
			m_repeatCounter = repeatCount;
			m_stateTo.alpha = 0;
			if(null != m_stateFrom)
			{
				m_timer = new Timer(delay, repeatCount);
				m_timer.addEventListener(TimerEvent.TIMER, OnTickFadeIn);
				m_timer.addEventListener(TimerEvent.TIMER_COMPLETE, OnTimerCompleteIn);
				m_timer.start();
			}
			else
			{
				PrepareToOut();
			}
		}
		
		private function OnTickFadeIn(event:TimerEvent):void
		{
			m_stateFrom.alpha = 1.0 - Number(event.target.currentCount) / Number(m_repeatCounter);
		}
		
		private function OnTimerCompleteIn(event:Event):void
		{
			PrepareToOut();
		}
		
		private function PrepareToOut():void
		{
			m_stateTo.alpha = 0;
			m_timer = new Timer(m_delay, m_repeatCounter);
			m_timer.addEventListener(TimerEvent.TIMER, OnTickFadeOut);
			m_timer.addEventListener(TimerEvent.TIMER_COMPLETE, OnTimerCompleteOut);
			m_timer.start();
		}
		
		private function OnTickFadeOut(event:TimerEvent):void
		{
			m_stateTo.alpha = Number(event.target.currentCount) / Number(m_repeatCounter);
		}
		
		private function OnTimerCompleteOut(event:Event):void
		{
			m_onDone.apply();
		}
		
		

		
	}

}