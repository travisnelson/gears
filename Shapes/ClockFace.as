package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	import flash.display.Sprite;
	
	public class ClockFace extends Shape {
		public var Radius:Number;
		
		public function ClockFace(radius:Number){
			var circleDef:b2CircleDef;			
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
			
			var handDef=new b2PolygonDef();
			handDef.density=1.0;
			handDef.friction=0.1;
			handDef.restitution=0.2;
			handDef.vertexCount=3;
			handDef.vertices[0].Set(-0.1,0.0);
			handDef.vertices[1].Set(0.0,-1.0);
			handDef.vertices[2].Set(0.1,0.0);
			handDef.filter.categoryBits=1;
			handDef.filter.maskBits=0;
			shapeDefs.push(handDef);
		}

		override public function Draw(m_sprite:Sprite, level:int){
			var scale=30;


			
			m_sprite.graphics.lineStyle(0);

			for each (var shape in shapes){
				if(shape.GetFilterData().categoryBits & level){
					if(shape is b2PolygonShape){
						m_sprite.graphics.beginFill(0xFFFFFF);				
						var vertices:Array=shape.GetVertices();
						var vertice=body.GetWorldPoint(vertices[0]);
	
						m_sprite.graphics.moveTo(vertice.x*scale, vertice.y*scale);
			
						for each(vertice in vertices){
							vertice=body.GetWorldPoint(vertice);
							m_sprite.graphics.lineTo(vertice.x*scale, vertice.y*scale);
						}						
						m_sprite.graphics.endFill();
					} else if(shape is b2CircleShape){
						m_sprite.graphics.beginFill(0x000000);				
						vertice=body.GetWorldPoint(shape.GetLocalPosition());
						m_sprite.graphics.drawCircle(vertice.x*scale, vertice.y*scale, shape.GetRadius()*scale);						
						m_sprite.graphics.endFill();
					}
				}
			}
	      m_sprite.graphics.endFill();
		}
	}
}