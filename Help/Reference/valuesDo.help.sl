# valuesDo

- _valuesDo(d, f:/1)_

Evaluate the block _f_ with each value of the dictionary _d_ as the argument.

```
>>> let r = [];
>>> (x: 1, y: 2, z: 3)
>>> .valuesDo { :each |
>>> 	r.add(each)
>>> };
>>> r
[1 2 3]
```

* * *

See also: associationsDo, do, keysAndValuesDo, keysDo

Guides: Iteration Functions

Categories: Enumerating
