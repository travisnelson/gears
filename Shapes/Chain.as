package Shapes {
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Shapes.*;
	import flash.display.Sprite;
	
	public class Chain extends Shape{		
		private var mainspring:Mainspring;
		private var fusee:SquaretoothGear;
		public var fusee_ratio:Number;
	
		public function Chain(m:Mainspring, f:SquaretoothGear){
			mainspring=m;
			fusee=f;
			collisionLevel=16;
		}
		
		override public function Draw(m_sprite:Sprite, level:int){
			m_sprite.graphics.beginFill(0x000000);

			var vertice1=mainspring.body.GetWorldPoint(mainspring.shapes[0].GetLocalPosition());
			m_sprite.graphics.moveTo((vertice1.x+mainspring.Radius)*30, vertice1.y*30);

			var vertice2=fusee.body.GetWorldPoint(fusee.shapes[0].GetLocalPosition());

			var chainTo=fusee.Radius*30;
			var ratio=fusee_ratio-0.5;
			chainTo = chainTo - (chainTo * (ratio / 1.5));
			if(chainTo<0)
				chainTo=0;
			
			
			m_sprite.graphics.lineTo((vertice2.x*30)+chainTo, vertice2.y*30);
			
			m_sprite.graphics.endFill();
		}
	}
}