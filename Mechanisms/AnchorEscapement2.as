package Mechanisms {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class AnchorEscapement2 extends Escapement {
		public function AnchorEscapement2(m_world:b2World,
																			x_off:Number, y_off:Number, z_off:Number){
			var myGear2=new AnchorGear();
			myGear2.toWorld(m_world, 0.979+x_off, 1.838+y_off, 0, 0+z_off);
			myGear2.attachToGround(m_world);
			Actors.push(myGear2);

			escapement=new Escapement2();
			escapement.toWorld(m_world, 1+x_off, 0.15+y_off, Math.PI, 0+z_off);
			escapement.attachToGround(m_world);
			Actors.push(escapement);

			var myGear1=new SquaretoothGear(0.5, 12);
			myGear1.toWorld(m_world, 0.979+x_off, 1.838+y_off, 0, 1+z_off);
			myGear1.attachToGround(m_world);
			Actors.push(myGear1);						
			myGear1.attachToShape(m_world, myGear2);
		}
		
	}
}