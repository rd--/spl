# StringDictionary -- dictionary

- _StringDictionary(anAssociationArray)_
- _StringDictionary(aDictionary)_

A type of _Dictionary_ where all the keys are strings.

	['x' -> 3.141, 'y' -> 23].StringDictionary.json = '{"x":3.141,"y":23}'
	['x' -> 3.141, 'y' -> 23].StringDictionary = (x: 3.141, y: 23).StringDictionary
	['pi' -> pi].StringDictionary.isDictionary = true

At the orindary constructor it is an error if any key is not a string.
There is an _unsafeStringDictionary_ form that coerces keys to strings.

	{ [pi -> 'pi'].StringDictionary }.ifError { :err | true }
	[pi -> 'pi'].Dictionary.unsafeStringDictionary.keys = ['3.141592653589793']

* * *

See also: _Dictionary_
