# Map

- _Map([k₁ v₁; k₂ v₂; …])_

A `Map` is a `Dictionary` type where the keys are compared using the identical to (`==`) operator.
See `isImmediate` for deciding if a value is suitable as a key.

Construct a `Map` from a list of lists:

```
>>> Map([1 2; 3 4; 5 6])
[1: 2, 3: 4, 5: 6]

>>> Map([[1, [2, 3]], [3, [4, 5, 6]]])
[1: [2 3], 3: [4 5 6]]
```

Construct an empty `Map`:

```
>>> Map()
[:]
```

`Map` treats negative zero as zero when used as a key:

```
>>> let m = Map();
>>> m[-0] := -0;
>>> (
>>> 	m.associations,
>>> 	m.keys.first.isNegativeZero,
>>> 	m.values.first.isNegativeZero
>>> )
([0 -> -0], false, true)
```

A Conway sequence,
OEIS [A004001](https://oeis.org/A004001):

~~~spl svg=A oeis=A004001
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		a[a[n - 1]] + a[n - a[n - 1]]
	}
};
a[1:75].scatterPlot
~~~

![](Help/Image/Map-A.svg)

Calculate the Stern-Brocot sequence,
OEIS [A002487](https://oeis.org/A002487):

~~~spl svg=B oeis=A002487
let a = Map { :n |
	(n < 2).if {
		n
	} {
		n.isEven.if {
			a[n / 2]
		} {
			a[(n - 1) / 2]
			+
			a[(n + 1) / 2]
		}
	}
};
a[0:200].scatterPlot
~~~

![](Help/Image/Map-B.svg)

A Conway sequence,
OEIS [A055748](https://oeis.org/A055748):

~~~spl svg=C oeis=A055748
let a = Map { :n |
	(n < 3).if {
		1
	} {
		a[a[n - 1]] + a[n - a[n - 2] - 1]
	}
};
a[1:250].scatterPlot
~~~

![](Help/Image/Map-C.svg)

A ternary code related to the Tower of Hanoi,
OEIS [A060583](https://oeis.org/A060583):

~~~spl svg=D oeis=A060583
let a = Map { :n |
	(n = 0).if {
		0
	} {
		let i = (n / 3).floor;
		3 * a[i] + ((0 - a[i] - n) % 3)
	}
};
a[0:65].discretePlot
~~~

![](Help/Image/Map-D.svg)

A ternary code,
OEIS [A060587](https://oeis.org/A060587),
inverse of
OEIS [A060583](https://oeis.org/A060583):

~~~spl svg=E oeis=A060587
let a = Map { :n |
	(n = 0).if {
		0
	} {
		let i = (n / 3).floor;
		3 * a[i] + ((0 - i - n) % 3)
	}
};
a[0:65].scatterPlot
~~~

![](Help/Image/Map-E.svg)

A ternary code related to the Tower of Hanoi,
modulo three
OEIS [A060582](https://oeis.org/A060582):

~~~spl svg=F oeis=A060582
let a = Map { :n |
	(n = 0).if {
		0
	} {
		let i = (n / 3).floor;
		3 * a[i] + ((0 - a[i] - n) % 3)
	}
};
(a[0:65] % 3).stepPlot
~~~

![](Help/Image/Map-F.svg)

A recurrence by Ctibor O. Zizka that becomes quasi-periodic,
OEIS [A133058](https://oeis.org/A133058):

~~~spl png=G oeis=A133058
let a = Map { :n |
	(n < 2).if {
		1
	} {
		let m = a[n - 1];
		let g = n.gcd(m);
		(g = 1).if {
			m + n + 1
		} {
			m // g
		}
	}
};
a[0:750].log.denseScatterPlot
~~~

![](Help/Image/Map-G.png)

Note: `Map` is _IdentityDictionary_ in Smalltalk.

* * *

See also: asMap, Dictionary, isImmediate, Record

Guides: Dictionary Functions, Map Syntax

Categories: Collection, Type
