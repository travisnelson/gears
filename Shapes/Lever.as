package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class Lever extends Shape{		
		public function Lever(){
			var pDef=new b2PolygonDef();
			pDef.density=1.0;
			pDef.friction=0.1;
			pDef.restitution=0.2;
			pDef.filter.categoryBits=0;
			pDef.filter.maskBits=0;
			pDef.vertexCount = 4
			pDef.vertices[0].Set(-0.23,0);
			pDef.vertices[1].Set(0,0.4);
			pDef.vertices[2].Set(0,1);
			pDef.vertices[3].Set(-0.1,1);
			shapeDefs.push(pDef);

			pDef=new b2PolygonDef();
			pDef.density=1.0;
			pDef.friction=0.1;
			pDef.restitution=0.2;
			pDef.filter.categoryBits=0;
			pDef.filter.maskBits=0;
			pDef.vertexCount = 4
			pDef.vertices[0].Set(0.23,0);
			pDef.vertices[1].Set(0.1,1);
			pDef.vertices[2].Set(0,1);
			pDef.vertices[3].Set(0,0.4);
			shapeDefs.push(pDef);
			
			pDef=new b2PolygonDef();
			pDef.density=1.0;
			pDef.friction=0.1;
			pDef.restitution=0.2;
			pDef.filter.categoryBits=0;
			pDef.filter.maskBits=0;
			pDef.vertexCount = 4
			pDef.vertices[0].Set(-1,1);
			pDef.vertices[1].Set(1,1);
			pDef.vertices[2].Set(1,1.2);
			pDef.vertices[3].Set(-1,1.2);
			shapeDefs.push(pDef);
			
			pDef=new b2PolygonDef();
			pDef.density=1.0;
			pDef.friction=0.1;
			pDef.restitution=0.2;
			pDef.filter.categoryBits=0;
			pDef.filter.maskBits=0;
			pDef.vertexCount = 4
			pDef.vertices[0].Set(-1,1.2);
			pDef.vertices[1].Set(-0.9,1.2);
			pDef.vertices[2].Set(-0.9,1.6);
			pDef.vertices[3].Set(-1,1.6);
			shapeDefs.push(pDef);

			pDef=new b2PolygonDef();
			pDef.density=1.0;
			pDef.friction=0.1;
			pDef.restitution=0.2;
			pDef.filter.categoryBits=0;
			pDef.filter.maskBits=0;
			pDef.vertexCount = 4
			pDef.vertices[0].Set(1,1.2);
			pDef.vertices[1].Set(1,1.6);
			pDef.vertices[2].Set(0.9,1.6);
			pDef.vertices[3].Set(0.9,1.2);
			shapeDefs.push(pDef);

			
		}
		
		override public function attachToGround(m_world:b2World){
			var jointDef = new b2RevoluteJointDef(); 
			jointDef.Initialize(m_world.GetGroundBody(), body, body.GetWorldPoint(new b2Vec2(0,1)));
			jointDef.lowerAngle=-0.25;
			jointDef.upperAngle=+0.25;
			jointDef.enableLimit=true;
			jointDef.maxMotorTorque=5.0;
			jointDef.motorSpeed=0.0;
			jointDef.enableMotor=true;			
			body.m_userData=m_world.CreateJoint(jointDef);
		}				
		
	}
}