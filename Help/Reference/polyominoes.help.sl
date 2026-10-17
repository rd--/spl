# polyominoes

- _polyominoes(n)_

Answer the free polyominoes of degree _n_.
Each polyomino is represented as a list of Gaussian integers.

The one free one-polyomino:

```
>>> polyominoes(1)
[
	[0J0]
]
```

The one free two-polyomino:

```
>>> polyominoes(2)
[
	[0J0 0J1]
]
```

The two free three-polyominoes:

```
>>> polyominoes(3)
[
	0J0 0J1 0J2;
	0J0 0J1 1J0
]
```

The five free four-polyominoes:

```
>>> polyominoes(4)
[
	0J0 0J1 0J2 0J3;
	0J0 0J1 0J2 1J0;
	0J0 0J1 0J2 1J1;
	0J0 0J1 1J0 1J1;
	0J1 0J2 1J0 1J1
]
```

The twelve free five-polyominoes:

```
>>> polyominoes(5)
[
	0J0 0J1 0J2 0J3 0J4;
	0J0 0J1 0J2 0J3 1J0;
	0J0 0J1 0J2 0J3 1J1;
	0J0 0J1 0J2 1J0 1J1;
	0J0 0J1 0J2 1J0 1J2;
	0J0 0J1 0J2 1J0 2J0;
	0J0 0J1 0J2 1J1 2J1;
	0J0 1J0 1J1 1J2 2J1;
	0J1 0J2 0J3 1J0 1J1;
	0J1 0J2 1J0 1J1 2J0;
	0J1 1J0 1J1 1J2 2J1;
	0J2 1J0 1J1 1J2 2J0
]
```

Count the free six-polyominoes:

```
>>> polyominoes(6).size
35
```

The twelve free five-polyominoes:

~~~spl svg=A
polyominoes(5)
.deepCollect(realImaginary/1)
.plus(1)
.collect { :p |
	p.booleanSparseArray([5 5]).normal
}.catenate.transpose.arrayMesh
~~~

![](Help/Image/polyominoes-A.svg)

* * *

See also: Complex, isGaussianInteger

Guides: Complex Number Functions

References:
_OEIS_
[1](https://oeis.org/A000105)
