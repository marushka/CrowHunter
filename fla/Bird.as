package
{
	import shapes.Circle;
	import Box2DAS.Dynamics.*;
	/**
	 * ...
	 * @author art
	 */
	public class Bird  extends Circle
	{
		//private var contacts:ContactList;
		private var isGravity:Boolean;
		
		public function Bird() 
		{
			isGravity = false;
			this.gotoAndStop("Stay");
		}
		
		public override function create():void 
		{
			reportBeginContact = true;
			reportEndContact = true;
			fixedRotation = true;
			super.create();
			//listenWhileVisible(world, StepEvent.STEP, parseInput, false, 10);
			listenWhileVisible(this, ContactEvent.BEGIN_CONTACT, handleContact);
			//contacts = new ContactList();
			//contacts.listenTo(this);
		}
		
		public function handleContact(e:ContactEvent):void 
		{
			if(!isGravity)
			{
				applyGravity = true;
				this.gotoAndStop("Fall");
			}
			//var p:Pellet = e.other.m_userData as Pellet;
//			if(p) {
//				Util.addChildAtPosOf(world, new FX1(), p);  
//				p.remove();
//			}
		}
		
	}

}