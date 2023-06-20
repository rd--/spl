# Record -- dictionary

- _Record(anAssociationArray)_
- _Record(aMap)_

A type of _Dictionary_ where all the keys are strings.

	['x' -> 3.141, 'y' -> 23].Record.json = '{"x":3.141,"y":23}'
	['x' -> 3.141, 'y' -> 23].Record = (x: 3.141, y: 23).Record
	['pi' -> pi].Record.isDictionary = true

At the ordinary constructor it is an error if any key is not a string.
There is an _unsafeRecord_ form that coerces keys to strings.

	{ [pi -> 'pi'].Record }.ifError { :err | true }
	[pi -> 'pi'].Map.unsafeRecord.keys = ['3.141592653589793']

* * *

See also: _Dictionary_, _Map_
