package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class SawtoothGear extends Shape{		
		public function SawtoothGear(radius:Number, nTeeth:int){
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

			var toothDef:b2PolygonDef;
		
			for(var i=0;i<nTeeth;++i){
				var angle=((2*Math.PI)/nTeeth)*i;
				var dx, dy, dAngle, dAngleOuter;
				
				toothDef = new b2PolygonDef()
				toothDef.density=1.0;
				toothDef.friction=0.1;
				toothDef.restitution=0.2;
				toothDef.vertexCount = 3
				toothDef.filter.categoryBits=0;
				toothDef.filter.maskBits=0;
				
				var toothLength=radius+0.3;
				dAngle=(((2*Math.PI)/nTeeth)/2); // width of tooth at base
//				dAngleOuter=(dAngle/2)/toothLength;
				dAngleOuter=dAngle;
				
				dx=Math.cos(angle + dAngle) * circleDef.radius;
				dy=Math.sin(angle + dAngle) * circleDef.radius;
				toothDef.vertices[0].Set(dx, dy);

				dx=Math.cos(angle - dAngle) * circleDef.radius;
				dy=Math.sin(angle - dAngle) * circleDef.radius;
				toothDef.vertices[1].Set(dx, dy);
				
				dx=Math.cos(angle - dAngleOuter) * toothLength;
				dy=Math.sin(angle - dAngleOuter) * toothLength;
				toothDef.vertices[2].Set(dx, dy);

				dx=Math.cos(angle + dAngleOuter) * toothLength;
				dy=Math.sin(angle + dAngleOuter) * toothLength;
//				toothDef.vertices[2].Set(dx, dy);

				shapeDefs.push(toothDef);
			}			
		}
	}
}