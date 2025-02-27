# replicateShape

- _replicateShape(anObject, aSequence)_

Make an array having shape _aSequence_, each entry being _anObject_:

```
>>> 'x'.replicateShape([3 2])
[
	'x' 'x';
	'x' 'x';
	'x' 'x'
]
```

C.f. `reshape`:

```
>>> [3].replicateShape([2 3])
[
	3;
	3;
	3:;
		3;
		3;
		3
]

>>> [3].reshape([2 3])
[3 3 3; 3 3 3]
```

C.f. `replicateEach`:

```
>>> [3 4].replicateShape([2 3])
[
	3 4;
	3 4;
	3 4:;
		3 4;
		3 4;
		3 4
]

>>> [3 4].replicateEach([2 3])
[3 3 4 4 4]
```

An empty shape answers a scalar:

```
>>> 'x'.replicateShape([])
'x'
```

* * *

See also: #, !, duplicateShape, replicateEach, replicateInteger, reshape, shape

Categories: Copying
