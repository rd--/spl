# staircasePath

- _staircasePath(v, u, o)_

Answer a list of coordinates corresponding to a staircase path along a lattice with basis vectors _v_.
The path is specified by a list of steps _u_,
each step is by a vector specified at _v_,
which must be indexable by the elements of _u_,
starting at the origin _o_.
The path forms a staircase since it is only possible to move along the lattice in positive unit steps.

At `Record`:

```
>>> (x: [1 0], y: [0 1])
>>> .staircasePath('xyxxyxyy', [0 0])
[0 0; 1 0; 1 1; 2 1; 3 1; 3 2; 4 2; 4 3; 4 4]
```

At `List`:

```
>>> [1 0; 0 1]
>>> .staircasePath([1 2 1 1 2 1 2 2], [0 0])
[0 0; 1 0; 1 1; 2 1; 3 1; 3 2; 4 2; 4 3; 4 4]
```

Plot a lower Christoffel word:

~~~spl svg=A
[0: [1 0], 1: [0 1]]
.staircasePath(
	9/11.lowerChristoffelWord(23),
	[0 0]
).Line
~~~

![](sw/spl/Help/Image/staircasePath-A.svg)

Plot in three dimensions:

~~~spl svg=B
[1 0 0; 0 1 0; 0 0 1]
.staircasePath(
	[1 2 3 2 3 1],
	[0 0 0]
).Line
~~~

![](sw/spl/Help/Image/staircasePath-B.svg)

* * *

See also: anglePath

Guides: Geometry Functions
