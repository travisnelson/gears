package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class BalanceWheel extends Shape{
		public function BalanceWheel(radius:Number){
			var circleDef:b2CircleDef;			
			
			// a shape for the body
			circleDef = new b2CircleDef();
			circleDef.radius = radius;
			circleDef.density = 1.0;
			circleDef.friction = 0.1;
			circleDef.restitution = 0.2;
			circleDef.filter.categoryBits=0;
			circleDef.filter.maskBits=0;
		
			shapeDefs.push(circleDef);			

			var jewel=new b2PolygonDef();
			jewel.density=1.0;
			jewel.friction=0.1;
			jewel.restitution=0.2;
			jewel.vertexCount=4;
			jewel.vertices[0].Set(-0.1,0.5);
			jewel.vertices[1].Set(0.1,0.5);
			jewel.vertices[2].Set(0.1,0.6);
			jewel.vertices[3].Set(-0.1,0.6);
			jewel.filter.categoryBits=1;
			jewel.filter.maskBits=0;
			shapeDefs.push(jewel);

		}

		override public function Update(){
			var joint=body.m_userData;
			var gain=joint.GetJointAngle();

			if(gain > 0.02){
				gain = -Math.sqrt(Math.abs(gain))*25.0;
			} else if(gain < -0.02){				
				gain = +Math.sqrt(Math.abs(gain))*25.0;
			} else {
				gain = 0;
			}
			joint.SetMotorSpeed(gain);

			super.Update();
		}

		override public function attachToGround(m_world:b2World){
			var jointDef = new b2RevoluteJointDef(); 
			jointDef.Initialize(m_world.GetGroundBody(), body, body.GetWorldCenter());
			jointDef.lowerAngle=-4.7;
			jointDef.upperAngle=+4.7;
			jointDef.enableLimit=true;
			jointDef.maxMotorTorque=20.0;
			jointDef.motorSpeed=0.0;
			jointDef.enableMotor=true;
			body.m_userData=m_world.CreateJoint(jointDef);
			body.SetBullet(true);
		}		
	}
}