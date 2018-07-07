package Mechanisms {
	import Shapes.*;
	
	public class Escapement extends Mechanism {
		public var escapement:Shape;
		
		public function Escapement(){
		}
		public function escAng(){
			var angle=int(escapement.body.GetAngle()*1000)/1000;
			return angle;
		}
	}
}