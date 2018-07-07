package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class Escapement2 extends Shape{		
		public function Escapement2(){
			var shapeDef:b2PolygonDef;
		
			shapeDef = new b2PolygonDef()
			shapeDef.density=1.0;
			shapeDef.friction=0.1;
			shapeDef.restitution=0.2;
			shapeDef.vertexCount = 8
			shapeDef.filter.categoryBits=0;
			shapeDef.filter.maskBits=0;
			shapeDef.vertices[0].Set(-1.3241, -0.8611);
			shapeDef.vertices[1].Set(-1.2514, -0.8814);
			shapeDef.vertices[2].Set(-1.1590, -0.8935);
			shapeDef.vertices[3].Set(-1.0498, -0.8991);
			shapeDef.vertices[4].Set(-0.9368, -0.8928);
			shapeDef.vertices[5].Set(-0.8380, -0.8773);
			shapeDef.vertices[6].Set(-0.7613, -0.8585);
			shapeDef.vertices[7].Set(-1.2205, -0.6650);
			shapeDefs.push(shapeDef);

			shapeDef = new b2PolygonDef()
			shapeDef.density=1.0;
			shapeDef.friction=0.1;
			shapeDef.restitution=0.2;
			shapeDef.vertexCount = 8
			shapeDef.filter.categoryBits=0;
			shapeDef.filter.maskBits=0;
			shapeDef.vertices[0].Set(0.8751, -0.8532);
			shapeDef.vertices[1].Set(1.0598, -0.4149);
			shapeDef.vertices[2].Set(0.8871, -0.2652);
			shapeDef.vertices[3].Set(0.8346, -0.4021);
			shapeDef.vertices[4].Set(0.8274, -0.4944);
			shapeDef.vertices[5].Set(0.8266, -0.5801);
			shapeDef.vertices[6].Set(0.8309, -0.6749);
			shapeDef.vertices[7].Set(0.8470, -0.7615);
			shapeDefs.push(shapeDef);

			shapeDef = new b2PolygonDef()
			shapeDef.density=1.0;
			shapeDef.friction=0.1;
			shapeDef.restitution=0.2;
			shapeDef.vertexCount = 8
			shapeDef.filter.categoryBits=0;
			shapeDef.filter.maskBits=0;
			shapeDef.vertices[0].Set(0.0013, -0.1287);
			shapeDef.vertices[1].Set(0.8368, -0.3948);
			shapeDef.vertices[2].Set(0.8862, -0.2640);
			shapeDef.vertices[3].Set(0.0944, -0.0195);
			shapeDef.vertices[4].Set(0.0013, 0.0943);
			shapeDef.vertices[5].Set(-0.0984, -0.0195);
			shapeDef.vertices[6].Set(-1.2176, -0.6629);
			shapeDef.vertices[7].Set(-1.0904, -0.7211);
			shapeDefs.push(shapeDef);

			shapeDef=new b2PolygonDef();
			shapeDef.density=0.01;
			shapeDef.friction=0.1;
			shapeDef.restitution=0.2;
			shapeDef.vertexCount=4;
			shapeDef.filter.categoryBits=4;
			shapeDef.filter.maskBits=4;
			shapeDef.vertices[0].Set(-0.05, 0);
			shapeDef.vertices[1].Set(0.05, 0);
			shapeDef.vertices[2].Set(0.05, -5);
			shapeDef.vertices[3].Set(-0.05, -5);
			shapeDefs.push(shapeDef);

			var circleDef:b2CircleDef;	
			circleDef = new b2CircleDef();
			circleDef.localPosition.Set(0, -6);
			circleDef.radius = 1.0;
			circleDef.density = 0.15;
			circleDef.friction = 0.1;
			circleDef.restitution = 0.2;
			circleDef.filter.categoryBits=4;
			circleDef.filter.maskBits=4;
			shapeDefs.push(circleDef);


		}
		
		override public function attachToGround(m_world:b2World){
			var jointDef = new b2RevoluteJointDef(); 
			jointDef.Initialize(m_world.GetGroundBody(), body, new b2Vec2(3,3));
			body.m_userData=m_world.CreateJoint(jointDef);			
		}
				
	}
}