package  
{
	import flash.geom.Point;
	import Geometric_Vector;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;

	/*
	File:Turtle.as
	
	Author:	Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
	Date: 09-30-13
	Partner: Georbec Ammon/ Conan Zhang
	Course:	Computer Science 1410 - EAE
	
	Description:
	
	The Turtle class utilizes functions from the Geometric_Vector class to create a turtle object that "moves" by drawing vectors from point to point.
	
	*/
	public class Turtle extends Sprite
	{
		//Member Variables for Constructor//
		private var directionVector: Geometric_Vector;
		
		private var startAngle: int = 0;
		private var turnAngle: Number;
		private var howManyLines: int;
		private var lineLength: int;
		private var lineColor: uint;
		private var lineThickness: int;
		private var lineAlpha: Number;
		
		
		//Member Variables for Class//
		private var linesDrawn: int = 0;
		private var currentPoint: Point;
		private var newPoint: Point;
		private var counter: int = 0;
		
		/*
		Summary of the Turtle constructor:
		The Turtle constructor takes in parameter argumetns to add a turtle object onto the stage and have it move.
		
		Parameters: 
		thisStage:DisplayObjectContainer = object to contain constructor
							   
		   startX 						= beginning x coordinate
		   startY 						= beginning y coordinate 
		   turnAngleParameter			= angle to turn 
		   howManyLinesParameter		= how many lines to draw
		   lineLengthParameter 			= length of line
		   lineColorParameter			= color of line
		   lineThicknessParameter 		= thickness of line
		   lineAlphaParameter 			= alpha of line
		
		Return Value: void
		
		Description: The constructor takes in values for a beginning location, turn angle, amount of lines to draw, lengths of those lines,
		colors of those lines, thicknesses of those lines, and the alphas of those lines. It then adds the turtle object onto the stage and
		has it move by listening to an event.
		
		*/
		public function Turtle(thisStage:DisplayObjectContainer,
							   startX: 						int, 
							   startY: 						int, 
							   turnAngleParameter:			Number, 
							   howManyLinesParameter:		int, 
							   lineLengthParameter: 		int,  
							   lineColorParameter:			uint, 
							   lineThicknessParameter: 		int, 
							   lineAlphaParameter: 			Number) 
		{
			//Assigning Member Variables to Parameters//
			currentPoint = new Point(startX, startY);
			turnAngle = turnAngleParameter;
			howManyLines = howManyLinesParameter;
			lineLength = lineLengthParameter;
			lineColor = lineColorParameter;
			lineThickness = lineThicknessParameter;
			lineAlpha = lineAlphaParameter;
			
			directionVector = new Geometric_Vector(lineLength, lineLength);
			
			//Adding Object//
			thisStage.addChild(this);
			
			//Make Turtle Move with Event Listener//
			this.addEventListener(Event.ENTER_FRAME, moveTurtle);
		}
		
		/*
		Summary of the moveTurtle function:
		The moveTurtle function "moves" the turtle by continually adding vectors to the last vector's endpoint.
		
		Parameters:
		event: Event = take in event information
		
		Return Value: void
		
		Description: 
		
		The moveTurtle function checks whether or not the amount of lines drawn has reached the lines we desire to be drawn.
		If they haven't, the function should continue to check until the amount of lines is drawn what we desire while continuouslly
		drawing more lines.
		
		It will eventually stop listening to the event by removing it.
		
		*/
		public function moveTurtle(event: Event):void
		{
			if (linesDrawn < howManyLines)
			{
				linesDrawn++;
				create_display_list();
			}
			else
			{
				this.removeEventListener(Event.ENTER_FRAME, moveTurtle);
			}
		}
		
		/*
		Summary of the create_display_list function:
		The create_display_list function connects points by continually drawing vectors and altering the angle the vectors are drawn at.
		
		Parameters: None
		
		Return Value: void
		
		Description: Sets up line values and computes a point to be drawn to. Draws line from current point to new point and sets new point as current.
		Changes the vectors direction and continues until instructed to stop.
		
		*/
		public function create_display_list():void
		{
			//Set Up Line for Drawing//
			this.graphics.lineStyle(lineThickness,lineColor,lineAlpha);
			this.graphics.moveTo(currentPoint.x,currentPoint.y);
			
			//Compute a New Point for the Turtle//
			newPoint = Geometric_Vector.add_point_vector(currentPoint, directionVector);
			
			//Draw a Line to the New Point from the Current Point//
			this.graphics.lineTo(newPoint.x, newPoint.y);
			
			//Set New Point as Current Point//
			currentPoint.x = newPoint.x;
			currentPoint.y = newPoint.y;
			
			//Rotate Vector Direction//
			directionVector.rotateVector(turnAngle);

		}

	}//End Class
	
}//End Package
