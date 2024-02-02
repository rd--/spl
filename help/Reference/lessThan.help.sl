# < -- comparison operator

- _aMagnitude < anotherMagnitude_

Answers _true_ if _aMagnitude_ is comparable with and less than _anotherMagnitude_.

	3 < 5
	3.4 < 5.6
	3/4 < 5/6
	'3' < '5'
	{ 3j3 < 5j5 }.ifError { true }
	{ '3' < 5 }.ifError { true }
	{ 3 < '5' }.ifError { true }

The name of this operator is _lessThan_.

	lessThan(3, 5)

* * *

See also: >, greaterThan, Magnitude
