# asSeconds -- converting

- _asSeconds(aDuration | aNumber)_ == _aNumber_

The method to get a duration in seconds, either directly from a number, or from a _Duration_.

_Rationale_: Duration has symmetrical constructors and accessors, i.e.

	5.seconds.isDuration
	5.seconds.seconds = 5

It is a confusing error if a Duration is required, but a Number is provided,
since what was intended as the accessor (say _seconds_) acts instead as a constructor.

_asSeconds_ allows the value provided to be either a Duration,
or a Number giving the duration directly in seconds.

There are equivalent methods for Angle (asRadians) and Frequency (asHertz) and Length (asMetres).

* * *

See also: Duration, seconds
