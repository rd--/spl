# duplicateShape

- _duplicateShape(anObject, aSequence)_

Evaluate _value(anObject)_ to fill each place in an array of the indicated shape.

A 2×3 matrix:

```
>>> { 1 }.duplicateShape([2 3])
[
	1 1 1;
	1 1 1
]
```

A 3×2×3 array:

```
>>> 1.duplicateShape([3 2 3])
[
	1 1 1;
	1 1 1:;
		1 1 1;
		1 1 1:;
			1 1 1;
			1 1 1
]
```

If the shape is empty answer a scalar:

```
>>> { 1 }.duplicateShape([])
1
```

* * *

See also: #, !, duplicateInteger, List, value

Categories: Copying
