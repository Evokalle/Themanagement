package 
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
	
	public class kaupunkipeli extends MovieClip
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
		
		public function kaupunkipeli()
		{
			// Listen to keyboard presses
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyReleaseHandler);
			stage.addEventListener(Event.ENTER_FRAME, cameraFollowCharacter);
			
			// Update screen every frame
			addEventListener(Event.ENTER_FRAME,enterFrameHandler);
			addEventListener(Event.ENTER_FRAME,seinät);
			addEventListener(Event.ENTER_FRAME,autot);
			
			
		}
		
		//*************************
		// Event Handling:
		
		protected function cameraFollowCharacter(evt:Event){
 		root.scrollRect = new Rectangle(beetle.x - stage.stageWidth/2, beetle.y - stage.stageHeight/2, stage.stageWidth*2, stage.stageHeight*2);
		}
		
		
		protected function enterFrameHandler(event:Event):void
		{
			 
			// Move up, down, left, or right
			if( left ) {
				beetle.x -= speed;
				beetle.rotation = 90;
				
			}
			if( right ) {
				beetle.x += speed;
				beetle.rotation = 270;
			}
			if( up ) {
				beetle.y -= speed;
				beetle.rotation = 180;
			}
			if( down ) {
				beetle.y += speed;
				beetle.rotation = 0;
			}
			
			// Move diagonally
			if( down && !right ) {
				beetle.rotation = 45;
			}
			if( down && !left ) {
				beetle.rotation = 315;
			}
			if( up && !right ) {
				beetle.rotation = 135;
			}
			if( up && !left ) {
				beetle.rotation = -135;
			}
			
			// Loop to opposite side of the masked 
			// area when the beetle travels off-screen.
			if( beetle.y < -800 ){
				beetle.y = -800;
			}
			if( beetle.y > 1600 ){
				beetle.y = 1600;
			}
			if( beetle.x < -890 ){
				beetle.x = -890;
			}
			if( beetle.x > 1790 ){
				beetle.x = 1790;
			}
		}
		
		
		protected function seinät(event:Event):void
		{
			// Detect if edges of the player beetle 
			// are colliding with the maze walls.
			if( down && !up ) {
				beetle.y += 0;
				if( seinä.wall.hitTestPoint(beetle.x,beetle.y+beetle.height,true) ){
					beetle.y -= 5;
				}
				if(seinä.wall.hitTestPoint(beetle.x+beetle.width,beetle.y+beetle.height,true) ){
					beetle.y -= 5;
				}
			}
			if(  up && !down ) {
				beetle.y -= 0;
				if( seinä.wall.hitTestPoint(beetle.x,beetle.y,true) ){
					beetle.y += 5;
				}
				if( seinä.wall.hitTestPoint(beetle.x+beetle.width,beetle.y,true) ){
					beetle.y += 5;
				}
			}
			if( left && !right ) {
				beetle.x -= 0;
				if( seinä.wall.hitTestPoint(beetle.x,beetle.y,true) ){
					beetle.x += 5;
				}
				if( seinä.wall.hitTestPoint(beetle.x,beetle.y+height,true) ){
					beetle.x += 5;
				}
			}
			if( right && !left ) {
				beetle.x += 0;
				if( seinä.wall.hitTestPoint(beetle.x+beetle.width,beetle.y,true) ){
					beetle.x -= 5;
				}
				if( seinä.wall.hitTestPoint(beetle.x+beetle.width,beetle.y+height,true) ){
					beetle.x -= 5;
				}
			}
		}
		
		protected function autot(event:Event):void
		{
		if( down && !up ) {
				beetle.y += 0;
				if( Auto_3.hitTestPoint(beetle.x,beetle.y+beetle.height,true) ){
					gotoAndStop(2);
				}
				if(seinä.wall.hitTestPoint(beetle.x+beetle.width,beetle.y+beetle.height,true) ){
					gotoAndStop(2);
				}
			}
			if(  up && !down ) {
				beetle.y -= 0;
				if( Auto_3.hitTestPoint(beetle.x,beetle.y,true) ){
					gotoAndStop(2);
				}
				if( Auto_3.hitTestPoint(beetle.x+beetle.width,beetle.y,true) ){
					gotoAndStop(2);
				}
			}
			if( left && !right ) {
				beetle.x -= 0;
				if( Auto_3.hitTestPoint(beetle.x,beetle.y,true) ){
					gotoAndStop(2);
				}
				if( Auto_3.hitTestPoint(beetle.x,beetle.y+height,true) ){
					gotoAndStop(2);
				}
			}
			if( right && !left ) {
				beetle.x += 0;
				if( Auto_3.hitTestPoint(beetle.x+beetle.width,beetle.y,true) ){
					gotoAndStop(2);
				}
				if( Auto_3.hitTestPoint(beetle.x+beetle.width,beetle.y+height,true) ){
					gotoAndStop(2);
				}
				loppu.width/2;
				
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