﻿package {
	import flash.utils.getTimer;
	
	
	public final class ExtendedMath {
		
		// For a start, we're mapping the native AS3 Math public constants
		// A mathematical constant for the base of natural logarithms, expressed as e.
		public static const E:Number = Math.E;
		// A mathematical constant for the natural logarithm of 10, expressed as loge10, with an approximate value of 2.302585092994046.
		public static const LN10:Number = Math.LN10;
		// A mathematical constant for the natural logarithm of 2, expressed as loge2, with an approximate value of 0.6931471805599453.
		public static const LN2:Number = Math.LN2;
		// A mathematical constant for the base-10 logarithm of the constant e (Math.E), expressed as log10e, with an approximate value of 0.4342944819032518.
		public static const LOG10E:Number = Math.LOG10E;
		// A mathematical constant for the base-2 logarithm of the constant e, expressed as log2e, with an approximate value of 1.442695040888963387.
		public static const LOG2E:Number = Math.LOG2E;
		// A mathematical constant for the ratio of the circumference of a circle to its diameter, expressed as pi, with a value of 3.141592653589793.
		public static const PI:Number = Math.PI;
		// A mathematical constant for the square root of one-half, with an approximate value of 0.7071067811865476.
		public static const SQRT1_2:Number = Math.SQRT1_2;
		// A mathematical constant for the square root of 2, with an approximate value of 1.4142135623730951.
		public static const SQRT2:Number = Math.SQRT2;
		//////////////////////
		/*     NEW STUFF    */
		//////////////////////		
		// Degrees-to-radians conversion constant 
		public static const DEG2RAD:Number = (PI * 2)/360;
		// Radians-to-degrees conversion constant
		public static const RAD2DEG:Number = 360/(PI * 2);
		// The smallest value that a float can have different from zero.
		public static const EPSILON:Number = Number.MIN_VALUE;
		// A representation of positive infinity.
		public static const INFINITY:Number = Number.POSITIVE_INFINITY;
		// A representation of negative infinity.
		public static const NEGATIVE_INFINITY:Number = Number.NEGATIVE_INFINITY;
		
		
		// We're mapping native AS3 Math metods		
		// Computes and returns an absolute value for the number specified by the parameter val.
		public static function abs(val:Number):Number { 
			// 3000% faster than Math.abs();
			return (val ^ (val >> 31)) - (val >> 31);
			// return Math.abs(val); 
		}	
		// Computes and returns the arc cosine of the specified angle in radians.
		public static function acos(angleRadians:Number):Number { return Math.acos(angleRadians); }
		// Computes and returns the arc sine of the specified angle in radians.
		public static function asin(angleRadians:Number):Number { return Math.asin(angleRadians); }			
		// Computes and returns the value, in radians, of the angle whose tangent is specified in the parameter val.
		public static function atan(angleRadians:Number):Number { return Math.atan(angleRadians); }	
		// Computes and returns the angle of the point y/x in radians, when measured counterclockwise from a circle's x axis (where 0,0 represents the center of the circle).
		public static function atan2(y:Number, x:Number):Number { return Math.atan2(y,x); }	
		// Returns the ceiling of the specified number or expression.
		public static function ceil(val:Number):int { return Math.ceil(val); }	
		// Computes and returns the cosine of the specified angle in radians.
		public static function cos(angleRadians:Number):Number { return Math.cos(angleRadians); }	
		// Returns the value of the base of the natural logarithm (e), to the power of the exponent specified in the parameter x.
		public static function exp(val:Number):Number { return Math.exp(val); }
		// Returns the floor of the number or expression specified in the parameter val.
		public static function floor(val:Number):int { return Math.floor(val); }
		// Returns the natural logarithm of the parameter val.
		public static function log(val:Number):Number { return Math.log(val); }
		// Evaluates one or more values and returns the largest value.
		public static function max(...params):Number { return Math.max.apply(null, params); }
		// Evaluates one or more values and returns the smallest value.
		public static function min(...params):Number { return Math.min.apply(null, params); }
		// Computes and returns base to the power of pow.
		public static function pow(base:Number, pow:Number):Number { return Math.pow(base,pow); }
		// Returns a pseudo-random number n, where 0 <= n < 1.
		public static function random():Number { return Math.random(); }
		// Rounds the value of the parameter val up or down to the nearest integer and returns the value.
		public static function round(val:Number):int { return Math.round(val); }		
		// Computes and returns the sine of the specified angle in radians.
		public static function sin(angleRadians:Number):Number { return Math.sin(angleRadians); }
		// Computes and returns the square root of the specified number.
		public static function sqrt(val:Number):Number { return Math.sqrt(val); }
		// Computes and returns the tangent of the specified angle			
		public static function tan(angleRadians:Number):Number { return Math.tan(angleRadians); }				
		//////////////////////
		/*     NEW STUFF    */
		//////////////////////
		// Checks if a number is even
		public static function even(val:Number):Boolean { 
			// 600% faster than val%2 == 0
			return (val & 1) == 0;
		}
		// Faster modulo for numbers divided by divisors which are power of 2
		public static function modulo(val:Number, divisor:int):int { 
			if(isPowerOfTwo(divisor)) {
				// 600% faster
				return val & (divisor - 1);
			} 
			return val%divisor;
		}
		// Checks if two numbers have the same sign
		public static function sameSign(val1:Number, val2:Number):Boolean { 
			// 35% faster than val1*val2>0
			return (val1 ^ val2) >= 0;
		}
		// Flip sign
		public static function flipSign(val:Number):Number { 
			// 300% faster than val = -val;
			return (val ^ -1) + 1;
		}
		// Swap integers
		public static function swapIntegers(val1:int, val2:int):Object { 
			// 20% faster than using a temp variable
			val1 ^= val2;			
			val2 ^= val1;
			val1 ^= val2;
			// shorter val2^=val1^=val2^=val1;
			return {v1:val1, v2:val2};
		}
		// Compares two floating point values if they are similar.
		public static function approximately(val1:Number, val2:Number):Boolean { 
			return abs(val1 - val2) < EPSILON; 
		}
		// Clamps a value between a minimum float and maximum float value.
		public static function clamp(val:Number, min:Number, max:Number):Number { 
			return (val < min)? min : (val > max)? max : val; 
		}
		// Clamps value between 0 and 1 and returns value.
		public static function clamp01(val:Number):Number { 
			return clamp(val,0,1); 
		}
		// Linearly interpolates between a and b by t.
		public static function lerp(val1:Number, val2:Number, t:Number):Number { 
			t = clamp01(t);
			return lerpUnclamped(val1,val2,t);
		}	
		// Linearly interpolates between a and b by t without clamping.
		public static function lerpUnclamped(val1:Number, val2:Number, t:Number):Number { 
			return val1 * (1 - t) + val2 * t;
		}
		// Linearly interpolates between a and b by t (inverse).
		public static function inverseLerp(a:Number, b:Number, val:Number):Number { 
			return (clamp(val, min(a, b), max(a, b)) - a) / (b - a);
		}		
		// Same as Lerp but makes sure the values interpolate correctly when they wrap around 360 degrees.
		public static function lerpAngle(a:Number, b:Number, val:Number):Number { 
			while (a > b + PI) {
				b += PI*2;
			}
			while (b > a + PI) {
				b -= PI*2;
			}
			return lerp(a, b, val);
		}
		// Moves a value current towards target.
		public static function moveTowards(current:Number, target:Number, maxDelta:Number):Number {
			var delta:Number = target - current;
			return (maxDelta >= delta) ? target : current + maxDelta;
		}
		// Same as MoveTowards but makes sure the values interpolate correctly when they wrap around 360 degrees.
		public static function moveTowardsAngle(current:Number, target:Number, maxDelta:Number):Number {
			var delta:Number = deltaAngle(target, current);
			return (maxDelta >= delta) ? target : current + maxDelta;
		}
		// Gradually changes a value towards a desired goal over time.
		public static function smoothDamp(current:Number, target:Number, currentVelocity:Number, smoothTime:Number, maxSpeed:Number = INFINITY, deltaTime:Number=0):Number {
			if(deltaTime == 0) {
				deltaTime = Time.deltaTime;
			}
			smoothTime = max(0.0001, smoothTime);
			var omega:Number = 2 / smoothTime;
			var x:Number = omega * deltaTime;
			var exp:Number = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x);
			var deltaX:Number = target - current;
			var maxDelta = maxSpeed * smoothTime;
			
			// ensure we do not exceed our max speed
			deltaX = clamp(deltaX, -maxDelta, maxDelta);
			var temp:Number = (currentVelocity + omega * deltaX) * deltaTime;
			var result:Number = current - deltaX + (deltaX + temp) * exp;
			currentVelocity = (currentVelocity - omega * temp) * exp;
			
			// ensure that we do not overshoot our target
			if ((target - current > 0) == (result > target)) {
				result = target;
				currentVelocity = 0;
			}
			return result;
		}	
		// Gradually changes an angle given in degrees towards a desired goal angle over time.
		public static function smoothDampAngle(current:Number, target:Number, currentVelocity:Number, smoothTime:Number, maxSpeed:Number = INFINITY, deltaTime:Number=0):Number {
			if(deltaTime == 0) {
				deltaTime = Time.deltaTime;
			}
			smoothTime = max(0.0001, smoothTime);
			var omega:Number = 2 / smoothTime;
			var x:Number = omega * deltaTime;
			var exp:Number = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x);
			var deltaX:Number = deltaAngle(target, current);
			var maxDelta = maxSpeed * smoothTime;
			
			// ensure we do not exceed our max speed
			deltaX = clamp(deltaX, -maxDelta, maxDelta);
			var temp:Number = (currentVelocity + omega * deltaX) * deltaTime;
			var result:Number = current - deltaX + (deltaX + temp) * exp;
			currentVelocity = (currentVelocity - omega * temp) * exp;
			
			// ensure that we do not overshoot our target
			if ((target - current > 0) == (result > target)) {
				result = target;
				currentVelocity = 0;
			}
			return result;
		}
		// Interpolates between min and max with smoothing at the limits.
		public static function smoothstep(min:Number, max:Number, val:Number):Number {
			// Scale, bias and saturate x to 0..1 range
			val = clamp01((val - min) / (max - min));
			// Evaluate polynomial
			return val*val*(3 - 2 * val);
		}
		// Calculates the shortest difference between two given angles given in degrees.
		public static function deltaAngle(angle1:Number, angle2:Number):Number {			
			var currRotation:Number = angle1;
			var newCourse:Number = angle2;
			var deltaAngle:int = (180/Math.PI) * Math.atan2((Math.cos(currRotation * Math.PI/180) * Math.sin(newCourse * Math.PI/180) - Math.sin(currRotation * Math.PI/180) * Math.cos(newCourse * Math.PI/180)), (Math.sin(currRotation * Math.PI/180) * Math.sin(newCourse * Math.PI/180) + Math.cos(currRotation * Math.PI/180) * Math.cos(newCourse * Math.PI/180)));
			return deltaAngle;
		}		
		// Calculates the shortest difference between two given angles given in radians.
		public static function deltaAngleRad(angle1:Number, angle2:Number):Number {			
			return deg2rad(deltaAngle(angle1,angle2));
		}
		// Returns the closest power of two value.
		public static function closestPowerOfTwo(val:Number):int {
			var smallest:Number = smallestPowerOfTwo(val);
			var next:Number = nextPowerOfTwo(val);
			var downDiff:Number = val-smallest;
			var upDiff:Number = next-val;
			return (downDiff < upDiff) ? smallest : next;
		}
		// Returns the smallest power of two value.
		public static function smallestPowerOfTwo(val:Number):int {
			return pow(2, ( log(val) / log(2) ) << 0);			
		}
		// Returns the next power of two value.
		public static function nextPowerOfTwo(val:Number):Number {
			return smallestPowerOfTwo(val)<<1;
		}
		// 	Returns true if the value is power of two.
		public static function isPowerOfTwo(val:Number):Boolean {
			//return (closestPowerOfTwo(val) == val) ? true : false;	
			return (val>0) ? ((val & -val) == val) : false;
		}		
		// Converts the given value from gamma (sRGB) to linear color space.
		public static function gammaToLinearSpace(val:Number, gamma:Number, max:Number):Number { 
			return max*pow(val/max, gamma);
		}
		// Converts the given value from linear to gamma (sRGB) color space.
		public static function linearToGammaSpace(val:Number, gamma:Number, max:Number):Number { 
			return max*pow(val/max, 1/gamma);
		}
		// PingPongs the value t, so that it is never larger than length and never smaller than 0.
		public static function pingPong(t:Number, len:Number):Number {
			if (t < 0) t = -t;
			var mod:Number = t % len;
			// if mod is even
			if (ceil(t / len) % 2 === 0) {
				return (mod === 0) ? 0 : len - mod;
			}
			return (mod === 0) ? len : mod;
		}
		// Loops the value t, so that it is never larger than length and never smaller than 0.
		public static function repeat(t:Number, len:Number):Number { 
			return t % len;
		}
		// Returns the sign of val.
		public static function sign(val:Number):int { 
			return (val < 0) ? -1 : 1;
		}
		// Generate 2D Perlin noise.
		public static function perlinNoise(x:Number, y:Number):Number { 
			// tbi
			// although you can use the BitmapData's method to generate the perlin noise which generates a Perlin noise image. 
			// public function perlinNoise(baseX:Number, baseY:Number, numOctaves:uint, randomSeed:int, stitch:Boolean, fractalNoise:Boolean, channelOptions:uint = 7, grayScale:Boolean = false, offsets:Array = null):void
			return 0;
		}
		// UTILITY METHODDS
		// Convert degrees to radians
		public static function deg2rad(val:Number):Number {
			return val * PI / 180;
		}
		// Convert radians to degrees
		public static function rad2deg(val:Number):Number {
			return val * 180 / PI;
		}
	}
	
}