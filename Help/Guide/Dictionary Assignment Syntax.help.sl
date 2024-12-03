# Dictionary Assignment Syntax

There is dictionary assignment syntax for both temporary variable initialisers:

```
>>> let (x, y, z) = (x: 1 * 2, y: 3 * 4, z: 5 * 6);
>>> [z, y, x]
[30, 12, 2]
```

and for variable assignment:

```
>>> var x, y, z;
>>> (x, y, z) := (x: 1 * 2, y: 3 * 4, z: 5 * 6);
>>> [z, y, x]
[30, 12, 2]
```

Fields may be accessed out of order:

```
>>> let (y, x) = (x: 1, y: 2);
>>> (x, y)
(1, 2)

>>> var x, y;
>>> (y, x) := (x: 1, y: 2);
>>> (x, y)
(1, 2)
````

It is an error if a requested field is not present:

```
>>> {
>>> 	let (x, y) = (x: 1);
>>> 	nil
>>> }.ifError { true }
true

>>> {
>>> 	var x, y;
>>> 	(x, y) := (x: 1);
>>> 	nil
>>> }.ifError { true }
true
```

It is an error if not all fields are matched:

```
>>> {
>>> 	let (x, y) = (x: 1, y: 2, z: 3);
>>> 	(x, y)
>>> }.ifError { true }
true

>>> {
>>> 	var x, y;
>>> 	(x, y) := (x: 1, y: 2, z: 3);
>>> 	(x, y)
>>> }.ifError { true }
true
```

* * *

See also: =, :=

Guides: List Assignment Syntax

Categories: Syntax
