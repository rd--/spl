# deleteMissing

- _deleteMissing(c)_

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

* * *

See also: Missing

Guides: Error Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteMissing.html)
