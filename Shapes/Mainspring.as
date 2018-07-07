package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class Mainspring extends Shape{
		public var Torque:Number;
		private var previousAngle:Number;
		public var Radius:Number;
		
		public function Mainspring(radius:Number, torque:Number){
			var circleDef:b2CircleDef;			
			
			Torque=torque;
			Radius=radius;
			
			// a shape for the body
			circleDef = new b2CircleDef();
			circleDef.radius = radius;
			circleDef.density = 1.0;
			circleDef.friction = 0.1;
			circleDef.restitution = 0.2;
			circleDef.filter.categoryBits=0;
			circleDef.filter.maskBits=0;
			shapeDefs.push(circleDef);
			
			var knobDef=new b2CircleDef();
			knobDef.radius=0.1;
			knobDef.density=0;
			knobDef.friction=0;
			knobDef.restitution=0;
			knobDef.filter.categoryBits=0;
			knobDef.filter.maskBits=0;
			knobDef.localPosition.Set(0.6, 0.0);
			shapeDefs.push(knobDef);


		}
		
		override public function attachToGround(m_world:b2World){			
			// add the joint
			var jointDef = new b2RevoluteJointDef(); 
			jointDef.Initialize(m_world.GetGroundBody(), body, body.GetWorldCenter());
			jointDef.maxMotorTorque=Torque;
			jointDef.motorSpeed=25;
			jointDef.enableMotor=true;
			previousAngle=body.GetAngle();
			body.m_userData=m_world.CreateJoint(jointDef);			
		}
		
		override public function Update(){
			if(previousAngle != body.GetAngle()){
				var angleDiff=body.GetAngle() - previousAngle;
				Torque = Math.max(Torque-angleDiff/100, 0);
				previousAngle=body.GetAngle();
			}
			if(body.m_userData)
				body.m_userData.SetMaxMotorTorque(Torque);
		}
		
	}
}