# keysDo

- _keysDo(d, f:/1)_

Evaluate the block _f_ with each key of the dictionary _d_ as the argument.

At `Record`:

```
>>> let r = [];
>>> (x: 1, y: 2, z: 3)
>>> .keysDo { :each |
>>> 	r.add(each)
>>> };
>>> r
['x' 'y' 'z']
```

At `List` of `Association`s:

```
>>> let r = [];
>>> [1 -> 'x', 2 -> 'y', 3 -> 'z']
>>> .keysDo { :each |
>>> 	r.add(each)
>>> };
>>> r
[1 2 3]
```

* * *

See also: associationsDo, do, keysAndValuesDo, valuesDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.2.12

Categories: Enumerating
