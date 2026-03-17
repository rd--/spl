# xorTriangle

- _xorTriangle([b₁ b₂ …])_

Answer the exclusive-or triangle given an initial bit string _b_.
Each subsequent string holds the exclusive-or of the two values above it.

```
>>> [1 0 1 0 0 1 1]
>>> .xorTriangle
[
	1 0 1 0 0 1 1;
	1 1 1 0 1 0;
	0 0 1 1 1;
	0 1 0 0;
	1 1 0;
	0 1;
	1
]
```

Numbers whose binary expansion generates rotationally symmetric _xor_-triangles,
OEIS [A334556](https://oeis.org/A334556):

```
>>> let notAllowed = { :n :m :x :k |
>>> 	let a = bitAt(n, m - k + 1);
>>> 	let b = bitAt(x, 1);
>>> 	a != b | {
>>> 		let c = bitAt(x, m - k + 1);
>>> 		let d = bitAt(n, k + 1);
>>> 		c != d
>>> 	}
>>> };
>>> 0:1000.select { :n |
>>> 	let m = n.bitLength - 1;
>>> 	let x = n;
>>> 	let r = true;
>>> 	0.toDoWithBreak(m) { :k :e:/0 |
>>> 		notAllowed(n, m, x, k)
>>> 		.ifTrue {
>>> 			r := false;
>>> 			e()
>>> 		};
>>> 		x := bitXor(x, x // 2)
>>> 	};
>>> 	r
>>> }
[
	  0   1  11  13  39
	 57  83  91 101 109
	151 233 543 599 659
	731 805 877 937 993
]
```

A rotationally symmetrical triangle with side length seven,
the seventh entry in the list of such triangles:

~~~spl svg=A
83
.integerDigits(2)
.xorTriangle
.triangularArrayPlot
~~~

![](Help/Image/xorTriangle-A.svg)

A rotationally symmetrical triangle with side length sixteen that has a central triangles of zeroes,
the fortieth entry in the list of such triangles:

~~~spl svg=B
59257
.integerDigits(2)
.xorTriangle
.triangularArrayPlot
~~~

![](Help/Image/xorTriangle-B.svg)

Another rotationally symmetrical triangle that has a central triangles of zeroes,
the fourty-fifth entry in the list of such triangles:

~~~spl svg=C
63713
.integerDigits(2)
.xorTriangle
.triangularArrayPlot
~~~

![](Help/Image/xorTriangle-C.svg)

Numbers whose binary expansion generates rotationally symmetric _xor_-triangles,
OEIS [A334556](https://oeis.org/A334556):

~~~spl svg=D oeis=A334556
OeisEntry('A334556').then { :e |
	e.data.discretePlot
}
~~~

![](Help/Image/xorTriangle-D.svg)

Numbers whose binary expansion generate rotationally symmetrical _xor_-triangles that have central triangles of zeros,
OEIS [A334769](https://oeis.org/A334769):

~~~spl svg=E oeis=A334769
OeisEntry('A334769').then { :e |
	e.data.discretePlot
}
~~~

![](Help/Image/xorTriangle-E.svg)

* * *

See also: bitXor, triangularArrayPlot, xor

Guides: Bitwise Functions, Geometry Functions

References:
_OEIS_
[1](https://oeis.org/A334556)
[2](https://oeis.org/A334769)
