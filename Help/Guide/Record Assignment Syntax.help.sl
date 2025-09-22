# Record Assignment Syntax

There is a record assignment syntax for both temporary variable initialisers:

```
>>> let d = (x: 1 * 2, y: 3 * 4, z: 5 * 6);
>>> let (x: x, y: y, z: z) = d;
>>> [z, y, x]
[30, 12, 2]
```

and for variable assignment:

```
>>> var d, x, y, z;
>>> d := (x: 1 * 2, y: 3 * 4, z: 5 * 6);
>>> (x: x, y: y, z: z) := d;
>>> [z, y, x]
[30, 12, 2]
```

Fields may be accessed out of order:

```
>>> let (y: y, x: x) = (x: 1, y: 2);
>>> (x, y)
(1, 2)

>>> var x, y;
>>> (y: y, x: x) := (x: 1, y: 2);
>>> (x, y)
(1, 2)
````

It is an error if a requested field is not present:

```
>>> {
>>> 	let (x: x, y: y) = (x: 1);
>>> 	nil
>>> }.hasError
true

>>> {
>>> 	var x, y;
>>> 	(x: x, y: y) := (x: 1);
>>> 	nil
>>> }.hasError
true
```

It is an error if not all fields are matched:

```
>>> {
>>> 	let (x: x, y: y) = (x: 1, y: 2, z: 3);
>>> 	(x, y)
>>> }.hasError
true

>>> {
>>> 	var x, y;
>>> 	(x: x, y: y) := (x: 1, y: 2, z: 3);
>>> 	(x, y)
>>> }.hasError
true
```

* * *

See also: =, :=

Guides: List Assignment Syntax

Categories: Syntax
