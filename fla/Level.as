package
{
	import Box2DAS.Common.V2;
	import Box2DAS.Dynamics.b2Body;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import wck.WCK;
	import Box2DAS.Dynamics.StepEvent;
	/**
	 * ...
	 * @author art
	 */
	public class Level extends WCK
	{
		private var projectile:Projectile;
		private var prjX:Number;
		private var prjY:Number;
		private var m_world:wck.World;
		private var m_listener:Function;
		
		public function Level() 
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.MOUSE_MOVE, followCursor);
			projectile = getProjectile();
			prjX = -1;
			prjY = -1;
			m_world = null;
		}
		
		public function addDoneListener(listener:Function):void
		{
			m_listener = listener;
		}

		private function onMouseDown(event:MouseEvent):void
		{
			if(null != projectile)
			{
				if(-1 == prjX)
				{
					prjX = projectile.b2body.GetPosition().x;
					prjY = projectile.b2body.GetPosition().y;
				}
				projectile.applyGravity = false;
				projectile.b2body.SetLinearVelocity(new V2(0, 0));
				projectile.b2body.SetAngularVelocity(0);
				projectile.b2body.SetTransform(new V2(prjX, prjY), 0);
				
			}
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			ApplyImpulse2Projectile();
		}
		
		private function ApplyImpulse2Projectile():void
		{
			var world:DisplayObject = getChildByName("world");
			if(null != world)
			{
				if (null == m_world)
				{
					m_world = wck.World(world);
					m_world.addEventListener(StepEvent.STEP, onWorldUpdate, false, 10);
				}
				var im:V2 = new V2(mouseX - projectile.x, mouseY - projectile.y);
				var len:Number = im.length()  / Math.sqrt(400 * 400 + 300 * 300);
				if (len > 1.0) len = 1.0;
				im.normalize();
				im.x = im.x * len * 5;
				im.y = im.y * len * 5;
				var center:V2 = new V2(0, 0);
				projectile.applyGravity = true;
				projectile.b2body.ApplyImpulse(im, projectile.b2body.GetWorldCenter());
				
			}
		}
		
		private function followCursor(event:MouseEvent):void 
		{
			var force:DisplayObject = getChildByName("force");
			if(null != force)
			{
				var arrow:DisplayObject = MovieClip(force).getChildByName("arrow");
				if (null != arrow)
				{
					var coordy1 : Number = mouseY - force.y;
					var coordx1 : Number  = mouseX - force.x;
					var angleRadians1 : Number  = Math.atan2(coordy1,coordx1);
					var angleDegrees1 : Number  = angleRadians1 * 180 / Math.PI + 90;
					if (angleDegrees1 < 0) angleDegrees1 = 0;
					if (angleDegrees1 > 90) angleDegrees1 = 90;
					
					force.rotation = angleDegrees1;
					var vec:V2 = new V2(coordx1, coordy1);
					var len:Number = vec.length()  / Math.sqrt(400 * 400 + 300 * 300);
					if (len > 1.0) len = 1.0;
					var numFrame:int = MovieClip(arrow).totalFrames * len;
					MovieClip(arrow).gotoAndStop(numFrame);
				}
			}
		}
			
	
		private function getProjectile() : Projectile
		{
			var world:DisplayObject = getChildByName("world");
			if(null != world)
			{
				var numChildren = MovieClip(world).numChildren;
				for(var i:int = 0; i < numChildren; ++i)
				{
					var dobj:DisplayObject = MovieClip(world).getChildAt(i);
					if(dobj is  Projectile)
					{
						return Projectile(dobj);
					}
				}
			}
			return null;
			
		}
		
		private function onWorldUpdate(e:Event):void
		{
			var n:int = 0;
			var b:b2Body = this.m_world.b2world.GetBodyList();
			while (b)
			{
				if (b.GetUserData() is Bird)
				{
					var bird:Bird = Bird(b.GetUserData());
					if (bird.applyGravity == false)
					{
						++n;
						break;
					}
				}
				
				b = b.GetNext();
			}
			if (n == 0)
			{
				LevelComplete();
			}
		}
		
		private function LevelComplete():void
		{
			if (null != m_world)
			{
				m_world.removeEventListener(StepEvent.STEP, onWorldUpdate, false);
			}
			m_listener.apply();
		}
	
		
	}

}