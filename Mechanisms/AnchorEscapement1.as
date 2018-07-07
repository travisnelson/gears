package Mechanisms {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	
	public class AnchorEscapement1 extends Escapement {
		public function AnchorEscapement1(m_world:b2World, x_off:Number, y_off:Number, z_off:Number){
			var eGear2=new SawtoothGear(1, 16);
			eGear2.toWorld(m_world, 0.979+x_off, 0.838+y_off, 0, 0+z_off);
			eGear2.attachToGround(m_world);
			Actors.push(eGear2);

  			escapement=new Escapement1();
			escapement.toWorld(m_world, 2+x_off, 0.05+y_off, Math.PI, 0+z_off);
			escapement.attachToGround(m_world);
			Actors.push(escapement);
			
			var eGear1=new SquaretoothGear(0.5, 12);
			eGear1.toWorld(m_world, 0.979+x_off, 0.838+y_off, 0, 1+z_off);
			eGear1.attachToGround(m_world);
			Actors.push(eGear1);						
			eGear1.attachToShape(m_world, eGear2);
		}
		
	}
}