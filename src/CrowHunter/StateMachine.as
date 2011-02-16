package CrowHunter 
{
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.TimerEvent;

	/**
	 * ...
	 * @author Rockelk Game Lab
	 */
	public class StateMachine extends Sprite
	{

		private var oldState:State;
		private var currentState:State;
		private var transp:StateTransparent;
		
		public function StateMachine() 
		{
			AddState(StateEnum.MENU);
		}
		
		private function AddState(currentStateEnum:int):void
		{
			CreateState(currentStateEnum);
		}
		
		private function RemoveState():void
		{
			if (null != currentState)
			{
				removeChild(currentState);
				currentState = null;
			}
		}
		
		
		private function CreateState(currentStateEnum:int):void
		{
			oldState = currentState;
			if (currentStateEnum == StateEnum.MENU)
			{
				currentState =  new MenuState();
				currentState.addDoneListener(OnMenuDone);
				
			}
			else if (currentStateEnum == StateEnum.MAP)
			{
				currentState =  new MapState();
				currentState.addDoneListener(OnMapDone);
			}
			else if (currentStateEnum == StateEnum.GAME)
			{
				currentState =  new GameState();
				currentState.addDoneListener(OnGameDone);
			}
			currentState.AddListerens();
			addChild(currentState);
			transp = new StateTransparent(oldState, currentState, OnTransparentDone, 10, 50);
		}
		
		private function OnTransparentDone():void
		{
			if(null != oldState)
			{
				removeChild(oldState);
			}
		}
		
		private function OnMenuDone():void
		{
		   currentState.RemoveListerens();
		   AddState(StateEnum.MAP);
 
		}
		
		private function OnMapDone():void
		{
			currentState.RemoveListerens();
			AddState(StateEnum.GAME);
		}
		
		private function OnGameDone():void
		{
			currentState.RemoveListerens();
			//removeChild(currentState);
			AddState(StateEnum.MAP);
		}
	}

}