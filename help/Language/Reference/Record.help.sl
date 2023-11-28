# Record -- collection type

A _Record_ is a _Dictionary_ type where all the keys are strings.

There is a literal syntax for records.

	(x: 3.141, y: 23).isRecord

There is a conversion method from association lists:

	['x' -> 3.141, 'y' -> 23].asRecord.json = '{"x":3.141,"y":23}'
	['x' -> 3.141, 'y' -> 23].asRecord = (x: 3.141, y: 23)
	['pi' -> pi].asRecord.isDictionary = true

At the ordinary _asRecord_ constructor it is an error if any key is not a string.
There is an _unsafeRecord_ form that coerces keys to strings.

	{ [pi -> 'pi'].asRecord }.ifError { :err | true }
	[pi -> 'pi'].asMap.unsafeRecord.keys = ['3.141592653589793']

* * *

See also: asRecord, Association, Dictionary, Map
