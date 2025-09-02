# keysDo

- _keysDo(d, f:/1)_

Evaluate the block _f_ with each key of the dictionary _d_ as the argument.

```
>>> let r = [];
>>> (x: 1, y: 2, z: 3)
>>> .keysDo { :each |
>>> 	r.add(each)
>>> };
>>> r
['x' 'y' 'z']
```

* * *

See also: associationsDo, do, keysAndValuesDo, valuesDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.2.12

Categories: Enumerating
