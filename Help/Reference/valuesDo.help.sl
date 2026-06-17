# valuesDo

- _valuesDo(d, f:/1)_

Evaluate the block _f_ with each value of the dictionary _d_ as the argument.

At `Record`:

```
>>> let r = [];
>>> (x: 1, y: 2, z: 3)
>>> .valuesDo { :each |
>>> 	r.add(each)
>>> };
>>> r
[1 2 3]
```

At `List` of `Association`s:

```
>>> let r = [];
>>> [1 -> 'x', 2 -> 'y', 3 -> 'z']
>>> .valuesDo { :each |
>>> 	r.add(each)
>>> };
>>> r
['x' 'y' 'z']
```

* * *

See also: associationsDo, do, keysAndValuesDo, keysDo

Guides: Iteration Functions

Categories: Enumerating
