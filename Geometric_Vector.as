package  
{
	import flash.geom.Point;

	/*
	File:Geometric_Vector.as
	
	Author:	Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
	Date: 09-27-13
	Partner: Georbec Ammon/ Conan Zhang
	Course:	Computer Science 1410 - EAE
	
	Description:
	
	The Geometric_Vector class contains instructions to modify vectors.
	
	*/
	public class Geometric_Vector 
	{
		
		
		//Declared Private Class Member Variables for Use in the Constructor//
		private var memberX: Number = 0;
		private var memberY: Number = 0;		
		
		
		/*
		Summary of the Geometric_Vector constructor:
		The Geometric_Vector constructor makes sures the initial values of the object are set up correctly.
		
		Parameters: 
		
					originalX = memberX
					originalY = memberY
		
		Return Value: ...
		
		Description: The constructor takes in two parameters for X and Y and puts them in member variables.
		
		*/
		
		public function Geometric_Vector(originalX: Number, originalY: Number)
		{
			//Assigning Parameters to the Member Variables Declared Above//
			memberX = originalX;
			memberY = originalY;
		}
		
		
		/*
		Summary of the get_X function:
		The get_X function retruns the value of the x coordinate of our object.
		
		Parameters: ...
		
		Return Value: Integer
		
		Description: The get_X function returns the x coordinate of our object from
		our declared member variables because they are private.
		
		*/
		
		public function get_X(): Number
		{
			return memberX;
		}
		
		
		/*
		Summary of the get_Y function:
		The get_Y function retruns the value of the y coordinate of our object.
		
		Parameters: ...
		
		Return Value: Integer
		
		Description: The get_Y function returns the y coordinate of our object from
		our declared member variables because they are private.
		
		*/
		
		public function get_Y(): Number
		{
			return memberY;
		}
		
		/*
		Summary of the degrees_to_radians static function:
		The degrees_to_radians static function...
		
		Parameters:
					degrees:Number = inital degree value to be converted
		
		Return Value: Number
		
		Description: This static function converts degrees into radians because radians are 
		computer readable while degrees are easier for humans to understand.
		
		*/
		
		public static function degrees_to_radians(degrees:Number):Number
		{
			//Return the Value from the Formula to Convert Degrees into Radians
			//Formula: Radians = Degrees * (π/180) 
			return (degrees * (Math.PI / 180));
		}
		
		
		/*
		Summary of the addVectors static function:
		The addVectors static function takes two vectors, then returns a resulting vector from
		adding the two input vectors.
		
		Parameters: two Geometric_Vectors
		
		Return Value: a Geometric_Vector
		
		Description: Takes in two Geometric_Vectors and then returns the resultant vector from adding them together.
		*/
		
		public static function addVectors( vector_1 : Geometric_Vector, vector_2 : Geometric_Vector ) : Geometric_Vector
		{
			var addedVector: Geometric_Vector = new Geometric_Vector(vector_1.get_X()+vector_2.get_X()  ,  vector_1.get_Y()+vector_2.get_Y() );
			return addedVector;
		}
		
		
		/*
		Summary of the add_point_vector static function:
		The add_point_vector static function takes a given point and vector to return a resulting point
		from adding the input point and vector.
		
		Parameters: one Point and one Geometric_Vector
		
		Return Value: a Point
		
		Description: Adds the Point and the Geometric_Vector and returns the resultant Point.
		*/
		
		public static function add_point_vector( pointAPV : Point, vectorAPV : Geometric_Vector ) : Point
		{
			var addedPoint: Point = new Point (  pointAPV.x+vectorAPV.get_X(), pointAPV.y+vectorAPV.get_Y()  );
			return addedPoint;
		}
		
        
		
		/*
		Summary of the subtract static function:
		The subtract static function takes in two points and returns a vector that is the direction given
		by the two points.
		
		Parameters: two Points
		
		Return Value: a Geometric_Vector
		
		Description: Takes in two points and creates and returns a Geometric_Vector from them.
		
		*/
		
		public static function pointSubtract(point1: Point, point2: Point): Geometric_Vector
		{
			var subtractedVector: Geometric_Vector = new Geometric_Vector(  point2.x-point1.x , point2.y-point1.y  );
			return subtractedVector;
		}
		
		
		
		
		/*
		Summary of the scale function:
		The scale function scales a given vector.
		
		Parameters: a scalar Number
		
		Return Value: void
		
		Description: A given number(scalar) will be used to multiply the vector, scaling its size.
		*/	
		
		public function scaleVector(scalar: Number): void
		{
			memberX = memberX * scalar;
			memberY = memberY * scalar;
		}
		
		
		
		/*
		Summary of the magnitude function:
		The magnitude function reports the magnitude(length) of the vector.
		
		Parameters: None
		
		Return Value: Number = Represents length of vector
		
		Description: Just retuns the magnitude of the Geometric_Vector object (this)
		*/
		
		public function magnitude(): Number
		{
			return ( Math.sqrt( (memberX * memberX) + (memberY * memberY)) );
		}
		
		
		
		/*
		Summary of the normalize function:
		The normalize function scales vectors so that their magnitude is 1.
		
		Parameters: ...
		
		Return Value: void
		
		Description: Modifies a vector so that everything remains the same except its length will equal 1.
		*/
		
		public function normalize(): void
		{
			memberX = memberX / magnitude();
			memberY = memberY / magnitude();
		}
		
		
		
		/*
		Summary of the rotate function:
		The rotate function takes a given degree and modifies a vector by rotating it by radians.
		
		Parameters: degrees Number
		
		Return Value: void
		
		Description: Takes in a degrees value, converts that value to radians,
						finds the sine and cosine of that radian, calculates 
						X and Y according to the above vars, then sets X and Y.
		*/
		
		public function rotateVector(degreesToRotate: Number): void
		{
			//convert degrees to radians
			var theta: Number = degrees_to_radians(degreesToRotate);
			
			//find sine and cosine of the radians found above
			var cosineTheta = Math.cos(theta);
			var sineTheta   = Math.sin(theta);
			
			//calculate the rotation in temporary variables because we have to reuse the member variables
			var tempMemberX = (memberX * cosineTheta) - (memberY * sineTheta);
			var tempMemberY = (memberX * sineTheta)   + (memberY * cosineTheta);
			
			//assign temporary variables to the member variables
			memberX = tempMemberX;
			memberY = tempMemberY;
			
		}
		
		
		
		/*
		Summary of the convertToString function:
		The convertToString function returns a string that gives us information about our vector.
		
		Parameters: None
		
		Return Value: String
		
		Description: Gives string of everything we need to know about a vector.
		*/
		
		public function convertToString(): String
		{
			var vectorReportString: String = "memberX   is: " + memberX     + "\n" +
											 "memberY   is: " + memberY     + "\n" +
											 "magnitude is: " + magnitude();
			return vectorReportString;
											 
		}
		
		/*
		Summary of the clone function:
		Returns a new Geometric_Vector that is the same as this one, but it's own object (NOT ALIAS).
		
		Parameters: None
		
		Return Value: Geometric_Vector
		
		Description: Clones a Geometric_Vector and returns a new object with the same data as this one.
		*/		
		public function clone(): Geometric_Vector
		{
			var returnThisVector: Geometric_Vector = new Geometric_Vector(memberX, memberY);
			
			return returnThisVector;
											 
		}
		
		
		
	}//End Class
	
}//End Package
