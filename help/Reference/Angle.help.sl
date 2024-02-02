# Angle -- geometry type

A type representing a unit of measure for angles.

- _degrees(aNumber)_
- _radians(aNumber)_

An angle is constructed by the _degrees_ and _radians_ methods at _Number_.

	360.degrees.isAngle
	2.pi.radians.isAngle

- _degrees(anAngle)_
- _radians(anAngle)_

There are _degrees_ and _radians_ accessors.

	2.pi.radians.degrees = 360
	360.degrees.radians = 2.pi

The circular functions are implemented:

	30.degrees.cos ~ (3.sqrt / 2)

* * *

See also: degreesToRadians, radiansToDegrees
