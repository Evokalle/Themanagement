package com.asgamer.basics1{
	
	import com.senocular.utils.KeyObject;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.ui.Keyboard;
	
	public class Ship extends MovieClip	{
		
		private var stageRef:Stage;
		private var key:KeyObject;
		
		public function Ship(stageRef:Stage)
		{
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event) : void
		{
			if (key.isDown(Keyboard.LEFT))
				x -= 2;
			else if (key.isDown(Keyboard.RIGHT))
				x += 2;
			
			if (key.isDown(Keyboard.UP))
				y -= 2;
			else if (key.isDown(Keyboard.DOWN))
				y += 2;
		}
		
	}
	
}