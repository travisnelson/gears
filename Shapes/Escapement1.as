package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class Escapement1 extends Shape{		
		public function Escapement1(){
			var escDef:b2PolygonDef;
			escDef=new b2PolygonDef();
			escDef.density=1.0;
			escDef.friction=0.1;
			escDef.restitution=0.2;
			escDef.vertexCount=3;			
			escDef.filter.categoryBits=0;
			escDef.filter.maskBits=0;
			escDef.vertices[0].Set(0.0, 0.0);
			escDef.vertices[1].Set(0.0, 1.0);
			escDef.vertices[2].Set(-1.0, 1.0);
			shapeDefs.push(escDef);
			
			escDef=new b2PolygonDef();
			escDef.density=1.0;
			escDef.friction=0.1;
			escDef.restitution=0.2;
			escDef.vertexCount=3;
			escDef.filter.categoryBits=0;
			escDef.filter.maskBits=0;
			escDef.vertices[0].Set(3.0, 1.0);
			escDef.vertices[1].Set(2.0, 1.0);
			escDef.vertices[2].Set(2.0, 0.0);
			shapeDefs.push(escDef);
			
			escDef=new b2PolygonDef();
			escDef.density=1.0;
			escDef.friction=0.1;
			escDef.restitution=0.2;
			escDef.vertexCount=3;
			escDef.filter.categoryBits=0;
			escDef.filter.maskBits=0;
			escDef.vertices[0].Set(-1.0, 1.0);
			escDef.vertices[1].Set(3.0, 1.0);
			escDef.vertices[2].Set(1.0, 2.0);
			shapeDefs.push(escDef);
			
			escDef=new b2PolygonDef();
			escDef.density=1.0;
			escDef.friction=0.1;
			escDef.restitution=0.2;
			escDef.vertexCount=4;
			escDef.filter.categoryBits=4;
			escDef.filter.maskBits=4;
			escDef.vertices[0].Set(0.75, 1);
			escDef.vertices[1].Set(1.25, 1);
			escDef.vertices[2].Set(1.25, -4.0);
			escDef.vertices[3].Set(0.75, -4.0);
			shapeDefs.push(escDef);

			var circleDef:b2CircleDef;	
			circleDef = new b2CircleDef();
			circleDef.localPosition.Set(1.0, -5.0);
			circleDef.radius = 1;
			circleDef.density = 0.25;
			circleDef.friction = 0.1;
			circleDef.restitution = 0.2;
			circleDef.filter.categoryBits=4;
			circleDef.filter.maskBits=4;
			shapeDefs.push(circleDef);
		}
		
		override public function attachToGround(m_world:b2World){
			var jointDef = new b2RevoluteJointDef(); 
			jointDef.Initialize(m_world.GetGroundBody(), body, new b2Vec2(body.GetPosition().x-1,body.GetPosition().y-1.05));
			body.m_userData=m_world.CreateJoint(jointDef);			
		}

	}
}