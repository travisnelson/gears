package Mechanisms {
	public class Mechanism {
		public var Actors:Array=new Array();
		
		public function Mechanism(){
		}
		
		public function Update(){
			for each (var actor in Actors){
				actor.Update();
			}			
		}
		
	}
	
}