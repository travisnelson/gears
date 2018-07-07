package Mechanisms {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	import flash.display.Sprite;
	
	public class FuseeMainspring extends Mechanism {
		public var mainspring:Mainspring;

		private var fusee_stage=0;
		private var fusee_joint;
		private var fusee1, fusee2, fusee3, fusee4;
		private var m_world:b2World;
		public var chain;
		
		private var mainspring_radius=1;
		private var fusee1_radius=2;
		private var fusee2_radius=1.5;
		private var fusee3_radius=1;
		private var fusee4_radius=0.5;
		
		public function FuseeMainspring(m_w:b2World, x_off:Number, y_off:Number, z_off:Number){
			m_world=m_w;
			
			mainspring=new Mainspring(mainspring_radius, 30);
			mainspring.toWorld(m_world, 0+x_off, 7+y_off, 0, 1+z_off);
			mainspring.attachToGround(m_world);
	   		Actors.push(mainspring);
			
			fusee1=new SquaretoothGear(fusee1_radius, 48);
			fusee1.toWorld(m_world, 0+x_off, 3.5+y_off, 0, 2+z_off);
			fusee1.attachToGround(m_world);
			Actors.push(fusee1);

			fusee2=new SquaretoothGear(fusee2_radius, 36);
			fusee2.toWorld(m_world, 0+x_off, 3.5+y_off, 0, 4+z_off);
			fusee2.attachToGround(m_world);
			Actors.push(fusee2);
			fusee2.attachToShape(m_world, fusee1);
			
			fusee3=new SquaretoothGear(fusee3_radius, 24);
			fusee3.toWorld(m_world, 0+x_off, 3.5+y_off, 0, 8+z_off);
			fusee3.attachToGround(m_world);
			Actors.push(fusee3);
			fusee3.attachToShape(m_world, fusee1);

			fusee4=new SquaretoothGear(fusee4_radius, 12);
			fusee4.toWorld(m_world, 0+x_off, 3.5+y_off, 0, 16+z_off);
			fusee4.attachToGround(m_world);
			Actors.push(fusee4);
			fusee4.attachToShape(m_world, fusee1);

			fusee_joint=mainspring.attachToShape(m_world, fusee1);
			
			chain=new Chain(mainspring, fusee1);
			Actors.push(chain);
		}
		
		public function updateJoint(ratio:Number){
			m_world.DestroyJoint(fusee_joint);
			var jointDef = new b2GearJointDef();
			jointDef.body1 = mainspring.body;
			jointDef.body2 = fusee1.body;
			jointDef.joint1 = mainspring.body.GetUserData();
			jointDef.joint2 = fusee1.body.GetUserData();
			jointDef.ratio=-ratio;
			fusee_joint=m_world.CreateJoint(jointDef);			
		}
		
		override public function Update(){
			chain.fusee_ratio=1/((mainspring.Torque / 9.5) * 0.5);
			if(chain.fusee_ratio>2)
				chain.fusee_ratio=2;

			updateJoint(chain.fusee_ratio);
//			updateJoint(1.0);
			
			// 1/2 ratio, 38.8 torque
			// 1/1.5 ratio, 29.1 torque
			// 1/1 ratio,  19.4 torque
			// 1/0.5 ratio, 9.7 torque
			

			super.Update();
						
			// draw "chain" from spring to fusee?
		}
		
	}
}