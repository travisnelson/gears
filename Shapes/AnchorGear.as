package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class AnchorGear extends Shape{		
		public function AnchorGear(){
			var circleDef:b2CircleDef;			

			// a shape for the body
			circleDef = new b2CircleDef();
			circleDef.radius = 0.94;
			circleDef.density = 1.0;
			circleDef.friction = 0.1;
			circleDef.restitution = 0.2;
			circleDef.filter.categoryBits=0;
			circleDef.filter.maskBits=0;
			shapeDefs.push(circleDef);

			var toothDef:b2PolygonDef;
		
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.0784, 0.9349);
			toothDef.vertices[1].Set(-0.0091, 1.1966);
			toothDef.vertices[2].Set(-0.0091, 0.9393);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.1177, 0.9308);
			toothDef.vertices[1].Set(-0.2577, 1.1686);
			toothDef.vertices[2].Set(-0.2042, 0.9169);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.3087, 0.8860);
			toothDef.vertices[1].Set(-0.4951, 1.0895);
			toothDef.vertices[2].Set(-0.3904, 0.8544);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.4861, 0.8024);
			toothDef.vertices[1].Set(-0.7108, 0.9627);
			toothDef.vertices[2].Set(-0.5595, 0.7546);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.6423, 0.6838);
			toothDef.vertices[1].Set(-0.8954, 0.7939);
			toothDef.vertices[2].Set(-0.7042, 0.6217);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.7705, 0.5353);
			toothDef.vertices[1].Set(-1.0409, 0.5904);
			toothDef.vertices[2].Set(-0.8181, 0.4618);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.8649, 0.3634);
			toothDef.vertices[1].Set(-1.1409, 0.3611);
			toothDef.vertices[2].Set(-0.8962, 0.2816);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.9216, 0.1757);
			toothDef.vertices[1].Set(-1.1910, 0.1160);
			toothDef.vertices[2].Set(-0.9351, 0.0891);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.9380, -0.0198);
			toothDef.vertices[1].Set(-1.1891, -0.1342);
			toothDef.vertices[2].Set(-0.9332, -0.1073);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.9134, -0.2144);
			toothDef.vertices[1].Set(-1.1353, -0.3785);
			toothDef.vertices[2].Set(-0.8905, -0.2990);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.8489, -0.3996);
			toothDef.vertices[1].Set(-1.0318, -0.6062);
			toothDef.vertices[2].Set(-0.8089, -0.4776);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.7472, -0.5673);
			toothDef.vertices[1].Set(-0.8832, -0.8075);
			toothDef.vertices[2].Set(-0.6919, -0.6353);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.6129, -0.7103);
			toothDef.vertices[1].Set(-0.6960, -0.9735);
			toothDef.vertices[2].Set(-0.5447, -0.7653);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.4519, -0.8222);
			toothDef.vertices[1].Set(-0.4784, -1.0969);
			toothDef.vertices[2].Set(-0.3737, -0.8618);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.2710, -0.8982);
			toothDef.vertices[1].Set(-0.2399, -1.1724);
			toothDef.vertices[2].Set(-0.1864, -0.9207);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(-0.0784, -0.9349);
			toothDef.vertices[1].Set(0.0091, -1.1966);
			toothDef.vertices[2].Set(0.0091, -0.9393);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.1177, -0.9308);
			toothDef.vertices[1].Set(0.2577, -1.1686);
			toothDef.vertices[2].Set(0.2042, -0.9169);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.3087, -0.8860);
			toothDef.vertices[1].Set(0.4951, -1.0895);
			toothDef.vertices[2].Set(0.3904, -0.8544);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.4861, -0.8024);
			toothDef.vertices[1].Set(0.7108, -0.9627);
			toothDef.vertices[2].Set(0.5595, -0.7546);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.6423, -0.6838);
			toothDef.vertices[1].Set(0.8954, -0.7939);
			toothDef.vertices[2].Set(0.7042, -0.6217);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.7705, -0.5353);
			toothDef.vertices[1].Set(1.0409, -0.5904);
			toothDef.vertices[2].Set(0.8181, -0.4618);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;

			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.8649, -0.3634);
			toothDef.vertices[1].Set(1.1409, -0.3611);
			toothDef.vertices[2].Set(0.8962, -0.2816);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.9216, -0.1757);
			toothDef.vertices[1].Set(1.1910, -0.1160);
			toothDef.vertices[2].Set(0.9351, -0.0891);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.9380, 0.0198);
			toothDef.vertices[1].Set(1.1891, 0.1342);
			toothDef.vertices[2].Set(0.9332, 0.1073);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.9134, 0.2144);
			toothDef.vertices[1].Set(1.1353, 0.3785);
			toothDef.vertices[2].Set(0.8905, 0.2990);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.8489, 0.3996);
			toothDef.vertices[1].Set(1.0318, 0.6062);
			toothDef.vertices[2].Set(0.8089, 0.4776);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.7472, 0.5673);
			toothDef.vertices[1].Set(0.8832, 0.8075);
			toothDef.vertices[2].Set(0.6919, 0.6353);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.6129, 0.7103);
			toothDef.vertices[1].Set(0.6960, 0.9735);
			toothDef.vertices[2].Set(0.5447, 0.7653);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.4519, 0.8222);
			toothDef.vertices[1].Set(0.4784, 1.0969);
			toothDef.vertices[2].Set(0.3737, 0.8618);
			shapeDefs.push(toothDef);
			toothDef = new b2PolygonDef()
			toothDef.density=1.0;
			toothDef.friction=0.1;
			toothDef.restitution=0.2;
			toothDef.vertexCount = 3
			toothDef.filter.categoryBits=0;
			toothDef.filter.maskBits=0;
			toothDef.vertices[0].Set(0.2710, 0.8982);
			toothDef.vertices[1].Set(0.2399, 1.1724);
			toothDef.vertices[2].Set(0.1864, 0.9207);
			shapeDefs.push(toothDef);

		}
	}
}