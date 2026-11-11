# anyAs

- _anyAs(c, n, f/1)_

Answer _n_ elements from the collection _c_ as a new collection constructed using _f_.
It is an error if there are not enough elements.

At `List`:

```
>>> [1.0 .. 9.0].anyAs(
>>> 	3,
>>> 	{ :k |
>>> 		IdentitySet()
>>> 	}
>>> )
IdentitySet[1.0 2.0 3.0]
```

At `Record`:

```
>>> (x: 1.0, y: 2.0, z: 3.0)
>>> .anyAs(2, nilList/1)
[1.0 2.0]
```

* * *

See also: any, anyOne, take

Categories: Accessing
