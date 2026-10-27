# modularDistance

- _modularDistance(i, j, m)_

Answer the shortest distance between _i_ and _j_ modulo _m_.

On a circle there are two distances between two points,
the arcs traversed clockwise and counterclockwise.
The modular distance is the least of the two arcs.

At `SmallFloat`:

```
>>> modularDistance(11, 2, 12)
3

>>> (11 - 2) % 12
9

>>> (2 - 11) % 12
3
```

The modular difference table for _m=7_:

```
>>> { :i :j |
>>> 	modularDistance(i, j, 7)
>>> }.table(0:6, 0:6)
[
	0 1 2 3 3 2 1;
	1 0 1 2 3 3 2;
	2 1 0 1 2 3 3;
	3 2 1 0 1 2 3;
	3 3 2 1 0 1 2;
	2 3 3 2 1 0 1;
	1 2 3 3 2 1 0
]

>>> { :i :j |
>>> 	(i - j) % 7
>>> }.table(0:6, 0:6)
[
	0 6 5 4 3 2 1;
	1 0 6 5 4 3 2;
	2 1 0 6 5 4 3;
	3 2 1 0 6 5 4;
	4 3 2 1 0 6 5;
	5 4 3 2 1 0 6;
	6 5 4 3 2 1 0
]
```

Threads over lists:

```
>>> [-5 .. 5].modularDistance(0, 5)
[0 1 2 2 1 0 1 2 2 1 0]
```

Different moduli:

```
let o = LfSaw(10, 0);
let d = o.modularDistance(
	0,
	[0 .. 8] * MouseX(0, 1 / 5, 0, 0.2)
);
SinOsc(d * 4000 + 400, 0).Splay * 0.1
```

Wrapping amplitude crossfade:

```
let n = 12;
let o = SinOsc(RandN(n, 300, 800), 0);
let x = MouseX(0, n * 2, 0, 0.2);
let d = modularDistance(
	x,
	[0 .. n - 1],
	n
);
(o * (1 - d).max(0)).Splay * 0.1
```

* * *

See also: %, -, absDif, mod, modularInverse, subtract

Guides: Modular Arithmetic Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ModDif.html),
_W_
[1](https://en.wikipedia.org/wiki/Modular_arithmetic)
