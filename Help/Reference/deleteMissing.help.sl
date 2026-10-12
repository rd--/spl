# deleteMissing

- _deleteMissing(c, n=1)_

Answer a copy of the collection _c_ without items that are `Missing`.

Delete missing elements in a list:

```
>>> let x = Missing('NotAvailable');
>>> [1 2 3 x 4 x].deleteMissing
[1 2 3 4]
```

Delete missing values from a record:

```
>>> let x = Missing('NotAvailable');
>>> (x: 1, y: x, z: 3).deleteMissing
(x: 1, z: 3)
```

`Nil` values are considered to be missing:

```
>>> [1 2 3 nil 5].deleteMissing
[1 2 3 5]
```

`NaN` values are considered to be missing:

```
>>> [1 2 3 NaN 5].deleteMissing
[1 2 3 5]
```

Descends into subcollections to level _n_:

```
>>> [1 NaN 3; 4 5 NaN].deleteMissing(Infinity)
[1 3; 4 5]

>>> [1, nil, [3, nil, 5]].deleteMissing(1)
[1, [3, nil, 5]]

>>> [1, nil, [3, nil, 5]].deleteMissing(2)
[1, [3, 5]]
```

* * *

See also: Missing

Guides: Error Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteMissing.html)
