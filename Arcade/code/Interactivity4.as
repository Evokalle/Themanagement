﻿package code
{
	/*****************************************
	 * Interactivity4 :
	 * Demonstrates movement controlled by the keyboard.
	 * -------------------
	 * See 4_keyboard.fla
	 ****************************************/
	 
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	
	public class Interactivity4 extends MovieClip
	{
		//*************************
		// Properties:
		
		public var up:Boolean = false;
		public var down:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		
		// Animation
		public var speed:Number = 5;
		//*************************
		// Constructor:
		
		public function Interactivity4()
		{
			// Listen to keyboard presses
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyReleaseHandler);
			stage.addEventListener(Event.ENTER_FRAME, cameraFollowCharacter);
			
			// Update screen every frame
			addEventListener(Event.ENTER_FRAME,enterFrameHandler);
			
			
		}
		
		//*************************
		// Event Handling:
		
		protected function cameraFollowCharacter(evt:Event){
 		root.scrollRect = new Rectangle(beetle.x - stage.stageWidth/2, beetle.y - stage.stageHeight/2, stage.stageWidth*2, stage.stageHeight*2);
		}
		
		
		protected function enterFrameHandler(event:Event):void
		{
			 
			// Move up, down, left, or right
			if( left && !right ) {
				beetle.x -= speed;
				beetle.rotation = 90;
				
			}
			if( right && !left ) {
				beetle.x += speed;
				beetle.rotation = 270;
			}
			if( up && !down ) {
				beetle.y -= speed;
				beetle.rotation = 180;
			}
			if( down && !up ) {
				beetle.y += speed;
				beetle.rotation = 0;
			}
			
			// Move diagonally
			if( left && up && !right && !down ) {
				beetle.rotation = 315;
			}
			if( right && up && !left && !down ) {
				beetle.rotation = 45;
			}
			if( left && down && !right && !up ) {
				beetle.rotation = 225;
			}
			if( right && down && !left && !up ) {
				beetle.rotation = 135;
			}
			
			// Loop to opposite side of the masked 
			// area when the beetle travels off-screen.
			if( beetle.y < -800 ){
				beetle.y = 1600;
			}
			if( beetle.y > 1600 ){
				beetle.y = -800;
			}
			if( beetle.x < -890 ){
				beetle.x = 1790;
			}
			if( beetle.x > 1790 ){
				beetle.x = -890;
			}
		}
		
		protected function keyPressHandler(event:KeyboardEvent):void
		{
			switch( event.keyCode )
			{
				case Keyboard.UP:
					up = true;
					up_mc.gotoAndStop(2);
					break;
					
				case Keyboard.DOWN:
					down = true;
					down_mc.gotoAndStop(2);
					break;
					
				case Keyboard.LEFT:
					left = true;
					left_mc.gotoAndStop(2);
					break;
					
				case Keyboard.RIGHT:
					right = true;
					right_mc.gotoAndStop(2);
					break;
			}
		}
		
		protected function keyReleaseHandler(event:KeyboardEvent):void
		{
			switch( event.keyCode )
			{
				case Keyboard.UP:
					up = false;
					up_mc.gotoAndStop(1);
					break;
					
				case Keyboard.DOWN:
					down = false;
					down_mc.gotoAndStop(1);
					break;
					
				case Keyboard.LEFT:
					left = false;
					left_mc.gotoAndStop(1);
					break;
					
				case Keyboard.RIGHT:
					right = false;
					right_mc.gotoAndStop(1);
					break;
			}
		}
	}
}