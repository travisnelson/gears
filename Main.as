package {
	import flash.display.Sprite;
	import flash.events.*;
	import flash.display.MovieClip;	
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.utils.*;
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import General.*;
	import Shapes.*;
	import Mechanisms.*;
	
	public class Main extends MovieClip {
		public var m_world:b2World;
		public var m_iterations:int = 10;
		public var m_timeStep:Number = 1.0/30.0;
		static public var m_sprite:Sprite;
		public var m_input:Input;
 		
		public var mainspring;
		
		public var escapement;
		public var fusee;
		public var pendulum;
		public var pendStart;
		public var pendLastAngle;
		public var pendPrevAngle;
		public var pendReported;
		public var periodCount = 0;
		public var periodTotal = 0;

		public var graphPoints:Array = new Array();
		
		public var Actors:Array=new Array();
		public var Mechs:Array=new Array();
		
		public function Main(){
			// Add event for main loop
			addEventListener(Event.ENTER_FRAME, Update, false, 0, true);

			m_sprite = new Sprite();
			addChild(m_sprite);
			m_input = new Input(m_sprite);

			// Create world AABB
			var worldAABB:b2AABB = new b2AABB();
			worldAABB.lowerBound.Set(-100.0, -100.0);
			worldAABB.upperBound.Set(100.0, 100.0);

			
			// Define the gravity vector
			var gravity:b2Vec2 = new b2Vec2(0.0, 10.0);
			
			// Allow bodies to sleep
			var doSleep:Boolean = true;

			// Construct a world object
			m_world = new b2World(worldAABB, gravity, doSleep);


			// sawtooth = 16 teeth, 2 seconds per tooth
			// connecting gear = 12 teeth, 32/12 = 2.66~ seconds per tooth
			// connecting gear 2 = 12 teeth, 2.66 per tooth
			// second gear = 30 teeth, 2.66*30 = 80 seconds per
			
			// c gear = 16 teeth = 2 seconds per
			

			// impulse control
			escapement=new AnchorEscapement1(m_world, 10, 4, 1);
			Mechs.push(escapement);

			// power
			fusee=new FuseeMainspring(m_world, 15, 2, 0);
			Mechs.push(fusee);

			// connecting gear
			var eGear3=new SquaretoothGear(0.5, 12);
			eGear3.toWorld(m_world, 12.05, 5.4, 0, 2);
			eGear3.attachToGround(m_world);
			Actors.push(eGear3);						

			// connecting gear
			var eGear4=new SquaretoothGear(0.5, 12);
			eGear4.toWorld(m_world, 9.95, 5.4, 0, 2);
			eGear4.attachToGround(m_world);
			Actors.push(eGear4);
								
			// seconds gear
			var secGear1=new SquaretoothGear(1.0, 30);
			secGear1.toWorld(m_world, 8.15, 4.9, 0, 2);
			secGear1.attachToGround(m_world);
			Actors.push(secGear1);						
			
			var clockFace1=new ClockFace(1.0);
			clockFace1.toWorld(m_world, 8.15, 4.9, 0, 99);
			clockFace1.attachToGround(m_world);
			Actors.push(clockFace1);
			clockFace1.attachToShape(m_world, secGear1);
			
			
			// minutes gear
			// 3.1 to 1
			var minGear1=new SquaretoothGear(1.0, 30);
			minGear1.toWorld(m_world, 8.4, 7.4, 0, 2);
			minGear1.attachToGround(m_world);
			Actors.push(minGear1);
			var minGear2=new SquaretoothGear(0.4, 10);
			minGear2.toWorld(m_world, 8.4, 7.4, 0, 4);
			minGear2.attachToGround(m_world);
			Actors.push(minGear2);
			minGear2.attachToShape(m_world, minGear1);
			
			// 3.1 to 1 (cumulative 9.61 to 1)
			var minGear3=new SquaretoothGear(1.0, 31);
			minGear3.toWorld(m_world, 6.8, 8.07, 0, 4);
			minGear3.attachToGround(m_world);
			Actors.push(minGear3);
			var minGear4=new SquaretoothGear(0.4, 10);
			minGear4.toWorld(m_world, 6.8, 8.07, 0, 8);
			minGear4.attachToGround(m_world);
			Actors.push(minGear4);
			minGear4.attachToShape(m_world, minGear3);

			// 3.1 to 1 (cumulative 29.791)
			var minGear5=new SquaretoothGear(1.0, 31);
			minGear5.toWorld(m_world, 6.37, 6.4, 0, 8);
			minGear5.attachToGround(m_world);
			Actors.push(minGear5);
			var minGear6=new SquaretoothGear(0.4, 10);
			minGear6.toWorld(m_world, 6.37, 6.4, 0, 16);
			minGear6.attachToGround(m_world);
			Actors.push(minGear6);
			minGear6.attachToShape(m_world, minGear5);

			var minGear7=new SquaretoothGear(1.0, 31);
			minGear7.toWorld(m_world, 5.45, 4.9, 0, 16);
			minGear7.attachToGround(m_world);
			Actors.push(minGear7);
			
			var clockFace2=new ClockFace(1.0);
			clockFace2.toWorld(m_world, 5.45, 4.9, 0, 99);
			clockFace2.attachToGround(m_world);
			Actors.push(clockFace2);
			clockFace2.attachToShape(m_world, minGear7);
			
/*
			var wheel=new BalanceWheel(1);
			wheel.toWorld(m_world, 5, 5, 0, 1);
			wheel.attachToGround(m_world);
			Actors.push(wheel);

			var lever=new Lever();
			lever.toWorld(m_world, 5, 5.4, 0, 2);
			lever.attachToGround(m_world);
			Actors.push(lever);

			var spring=new SawtoothGear(1,16);
			spring.toWorld(m_world, 5, 8.5, 0, 2);
			spring.attachToGround(m_world);
			Actors.push(spring);
*/
			
		}




		public function makeJoint(motor:Boolean, body:b2Body){
			var jointDef = new b2RevoluteJointDef(); 
			jointDef.Initialize(m_world.GetGroundBody(), body, body.GetWorldCenter());
			if(motor){
				jointDef.maxMotorTorque=100.0;
				jointDef.motorSpeed=0.25;
				jointDef.enableMotor=true;
			}
			body.m_userData=m_world.CreateJoint(jointDef);
		}

	 	private function dropGraphPoints(element:*, index:int, arr:Array):Boolean {
			return(element.x>=0);
				
        }

		public function updateGraph():void {
			var point=new Sprite();
			point.graphics.beginFill(0x000000);
			point.graphics.drawRect(0,0,2,2);
			point.graphics.endFill();

			point.x=graph.draw.width-4; // -4 for borders

			var t=int(pendPeriodText.text)-1750; // scale to graph area
			var new_y=int(t*(graph.draw.height/500.0));  // convert to pixels
			point.y=-new_y;

			if(-point.y<0){
				point.y=0;
			} else if(-point.y>(graph.draw.height-4)){
				point.y=-(graph.draw.height-4);
			}
			
			
			// scroll existing points to the left
			for each (var p in graphPoints){
				p.x-=2;
				if(p.x<0){
					graph.draw.removeChild(p);
				}
			}
			// remove points that have scrolled off
			graphPoints=graphPoints.filter(dropGraphPoints);
			
			graphPoints.push(point);
			graph.draw.addChild(point);			
		}
		
		public function Update(e:Event):void {
			/// pendulum reporting
			if(pendLastAngle < escapement.escAng())
				angleText1.text=String(escapement.escAng().toFixed(3));
			if(pendLastAngle > escapement.escAng()){
				pendPrevAngle=Number(angleText2.text);
				angleText2.text=String(escapement.escAng().toFixed(3));
			}
			
			pendPeriodText.text=String((getTimer()-pendStart));
			
			if(escapement.escAng() == Number(angleText1.text)){
				pendReported=false;
			} else if(escapement.escAng() == Number(angleText2.text)){
				if(!pendReported){
					historyText.text=fusee.mainspring.Torque.toFixed(4)+" "+(int((Number(angleText1.text)-pendPrevAngle)*1000)/1000)+" "+pendPeriodText.text+"\n"+historyText.text;
					if(pendPeriodText.text!="NaN"){
						periodCount++;
						periodTotal+=int(pendPeriodText.text);
						avgPeriod.text=String(((periodTotal/periodCount)/1000).toFixed(3))+" seconds";
						updateGraph();
					}
					pendReported=true;
					pendStart=getTimer();				
				}
			}
			torqueText.text=fusee.mainspring.Torque.toFixed(4);
			pendLastAngle=escapement.escAng();
			fuseeText.text=fusee.chain.fusee_ratio.toFixed(6);
	
			// Update mouse joint
			UpdateMouseWorld()
			MouseDestroy();
			MouseDrag();
	
			var actor;
			for each (actor in Actors){
				actor.Update();
			}
			var mech;
			for each (mech in Mechs){
				mech.Update();
			}
				
	
			m_world.Step(m_timeStep, m_iterations);
			Input.update();

			m_sprite.graphics.clear();
			for(var level=0;level<8;++level){
				for each (actor in Actors){
					if(actor.collisionLevel & Math.pow(2,level))
						actor.Draw(m_sprite, Math.pow(2,level));
				}
				for each (mech in Mechs){
					for each (actor in mech.Actors){
						if(actor.collisionLevel & Math.pow(2,level))
							actor.Draw(m_sprite, Math.pow(2,level));
					}
				}
						

			}
		}
		
		// world mouse position
		static public var mouseXWorldPhys:Number;
		static public var mouseYWorldPhys:Number;
		static public var mouseXWorld:Number;
		static public var mouseYWorld:Number;
		public var m_mouseJoint:b2MouseJoint;
		public var m_physScale:Number = 30;
		
		
		//======================
		// Update mouseWorld
		//======================
		public function UpdateMouseWorld():void{
			mouseXWorldPhys = (Input.mouseX)/m_physScale; 
			mouseYWorldPhys = (Input.mouseY)/m_physScale; 
			
			mouseXWorld = (Input.mouseX); 
			mouseYWorld = (Input.mouseY); 
		}
		
		
		
		//======================
		// Mouse Drag 
		//======================
		public function MouseDrag():void{
			// mouse press
			if (Input.mouseDown && !m_mouseJoint){
				var body:b2Body = GetBodyAtMouse();
				
				if (body)
				{
					trace(body.GetPosition().x+" "+body.GetPosition().y);
					
					
					
					if(Input.isKeyDown(16)){ //shift
						m_world.DestroyJoint(body.m_userData);
					}
					var md:b2MouseJointDef = new b2MouseJointDef();
					md.body1 = m_world.GetGroundBody();
					md.body2 = body;
					md.target.Set(mouseXWorldPhys, mouseYWorldPhys);
					md.maxForce = 300.0 * body.GetMass();
					md.timeStep = m_timeStep;
					m_mouseJoint = m_world.CreateJoint(md) as b2MouseJoint;
					body.WakeUp();
				}
			}
			
			
			// mouse release
			if (!Input.mouseDown){
				if (m_mouseJoint)
				{
					if(Input.isKeyDown(16)){ //shift
						makeJoint(false, m_mouseJoint.GetBody2());
					}
					
					m_world.DestroyJoint(m_mouseJoint);
					m_mouseJoint = null;
					
				}
			}
			
			
			// mouse move
			if (m_mouseJoint)
			{
				var p2:b2Vec2 = new b2Vec2(mouseXWorldPhys, mouseYWorldPhys);
				m_mouseJoint.SetTarget(p2);
			}
		}
		
		
		
		//======================
		// Mouse Destroy
		//======================
		public function MouseDestroy():void{
			// mouse press
			if (!Input.mouseDown && Input.isKeyPressed(68/*D*/)){
				
				var body:b2Body = GetBodyAtMouse(true);
				
				if (body)
				{
					m_world.DestroyBody(body);
					return;
				}
			}
		}
		
		
		
		//======================
		// GetBodyAtMouse
		//======================
		private var mousePVec:b2Vec2 = new b2Vec2();
		public function GetBodyAtMouse(includeStatic:Boolean=false):b2Body{
			// Make a small box.
			mousePVec.Set(mouseXWorldPhys, mouseYWorldPhys);
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(mouseXWorldPhys - 0.001, mouseYWorldPhys - 0.001);
			aabb.upperBound.Set(mouseXWorldPhys + 0.001, mouseYWorldPhys + 0.001);
			
			// Query the world for overlapping shapes.
			var k_maxCount:int = 10;
			var shapes:Array = new Array();
			var count:int = m_world.Query(aabb, shapes, k_maxCount);
			var body:b2Body = null;
			for (var i:int = 0; i < count; ++i)
			{
				if (shapes[i].GetBody().IsStatic() == false || includeStatic)
				{
					var tShape:b2Shape = shapes[i] as b2Shape;
					var inside:Boolean = tShape.TestPoint(tShape.GetBody().GetXForm(), mousePVec);
					if (inside)
					{
						body = tShape.GetBody();
						break;
					}
				}
			}
			return body;
		}
		

	}
}