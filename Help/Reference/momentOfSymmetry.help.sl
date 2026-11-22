# momentOfSymmetry

- _momentOfSymmetry(g, p, k=24)_
- _momentOfSymmetry(g/p)_

Answer the sequence of moment of symmetry scales specified by generator _g_ and period _p_.
The sequence ends when the next step would have only one interval size,
according to `~`,
or when the maximum depth _k_ is reached.

The diatonic scale is the last item in the _5/12_ sequence:

```
>>> 5/12.momentOfSymmetry
[
	5 7;
	5 5 2;
	3 2 3 2 2;
	1 2 2 1 2 2 2
]
```

Each of the scales given is a moment of symmetry scale:

```
>>> 5/12.momentOfSymmetry
>>> .allTrue { :each |
>>> 	Scale(each)
>>> 	.isMomentOfSymmetry
>>> }
true
```

The size of the scale at each step:

```
>>> 5/12.momentOfSymmetry
>>> .collect(size/1)
[2 3 5 7]
```

The symmetrical generator is _7/12_:

```
>>> 7/12.momentOfSymmetry
[
	7 5;
	2 5 5;
	2 2 3 2 3;
	2 2 2 1 2 2 1
]
```

The interval pairs only of the _41/58_ sequence:

```
>>> 41/58.momentOfSymmetry
>>> .collect(nub/1)
[
	41 17;
	24 17;
	 7 17;
	 7 10;
	 7  3;
	 4  3;
	 1  3;
	 1  2
]
```

The fifth level of the _41/58_ sequence:

```
>>> 41/58.momentOfSymmetry.at(5L)
[7 7 7 3 7 7 3 7 7 3]
```

The fifth level of the _17/41_ sequence:

```
>>> 17/41.momentOfSymmetry.at(5L)
[3 3 4 3 4 3 3 4 3 4 3 4]
```

_6L1s_ and _1L6s_ scales:

```
>>> 11/13.momentOfSymmetry.last
[1 2 2 2 2 2 2]

>>> 1/7.momentOfSymmetry.last
[1 1 1 1 1 2]
```

_5L2s_ and _2L5s_ scales:

```
>>> 7/12.momentOfSymmetry.last
[2 2 2 1 2 2 1]

>>> 4/9.momentOfSymmetry.last
[2 1 1 2 1 1 1]
```

The interval pairs only of the _22/49_ sequence:

```
>>> 24/49.momentOfSymmetry
>>> .collect(nub/1)
[
	22 27;
	22  5;
	17  5;
	12  5;
	 7  5;
	 2  5;
	 2  3;
	 2  1
]
```

The _58⅓/100_ sequence, rounded:

```
>>> momentOfSymmetry(175/3, 100/1)
[
	175/3 125/3;
	 50/3 125/3 125/3;
	 50/3  50/3  25/1 50/3 25/1;
	 50/3  50/3  50/3 25/3 50/3 50/3 25/3
]

>>> momentOfSymmetry(175/3, 100/1)
>>> .round
[
	58 42;
	17 42 42;
	17 17 25 17 25;
	17 17 17  8 17 17  8
]
```

The `prefixSum` of each scale tells the pitches of the scale,
concluding with the period:

```
>>> 5/12.momentOfSymmetry
>>> .collect(prefixSum/1)
[
	5 12;
	5 10 12;
	3  5  8 10 12;
	1  3  5  6  8 10 12
]
```

`nubCumulatively` indicates which pitches are introduced at each level:

```
>>> 5/12.momentOfSymmetry
>>> .collect(prefixSum/1)
>>> .nubCumulatively(==)
[5 12; 10; 3 8; 1 6]
```

`horogramDrawing` answers a line drawing of a circular Wilson horogram showing the scale structure.
`zero`,
and equivalently the period,
points upwards and intervals increase clockwise:

~~~spl svg=A
7/12.momentOfSymmetry
.horogramDrawing
~~~

![](Help/Image/momentOfSymmetry-A.svg)

A moment of symmetry with a generator derived as the phi-weighted mediant of _1/5_ and _3/14_,
considered to a depth of nine places:

~~~spl svg=B
1/5.phiWeightedMediant(3/14)
.momentOfSymmetry(1.0, 9L)
.horogramDrawing
~~~

![](Help/Image/momentOfSymmetry-B.svg)

An outer ring of the least step equally dividing the period can be appended before drawing:

~~~spl svg=C
let appendOuterRing = { :mos |
	let period = mos.anyOne.sum;
	let leastStep = mos.last.min;
	let k = (period / leastStep).round;
	mos ++ [List(k, leastStep)]
};
7/12.momentOfSymmetry
.appendOuterRing
.horogramDrawing
~~~

![](Help/Image/momentOfSymmetry-C.svg)

`rectangularHorogramDrawing` answers a line drawing of a rectangular Wilson horogram showing the scale structure.
`zero` is at the left,
intervals increase rightwards until the period,
which is at the right,
and rows are descending:

~~~spl svg=D
7/12.momentOfSymmetry
.rectangularHorogramDrawing
~~~

![](Help/Image/momentOfSymmetry-D.svg)

A rectangular drawing of the same phi-weighted mediant scale as above:

~~~spl svg=E
1/5.phiWeightedMediant(3/14)
.momentOfSymmetry(1.0, 9L)
.rectangularHorogramDrawing
~~~

![](Help/Image/momentOfSymmetry-E.svg)

`horogramTable` answers a `Html` table of a rectangular Wilson horogram showing the scale structure.
Requires that the scale have only integer step sizes:

~~~spl html=F
7/12.momentOfSymmetry
.horogramTable
~~~

<table style="width: 100%; border: solid 1px black;"><tbody>
<tr><td colspan="7">7</td><td colspan="5">5</td></tr>
<tr><td colspan="2">2</td><td colspan="5">5</td><td colspan="5">5</td></tr>
<tr><td colspan="2">2</td><td colspan="2">2</td><td colspan="3">3</td><td colspan="2">2</td><td colspan="3">3</td></tr>
<tr><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">2</td><td>1</td><td colspan="2">2</td><td colspan="2">2</td><td>1</td></tr>
<tr><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
</tbody></table>

* * *

See also: Scale, bjorklundsAlgorithm, bresenhamLineAlgorithm, horogramDrawing, horogramTable, isMomentOfSymmetry, momentOfSymmetryPattern, nubCumulatively, prefixSum, rectangularHorogramDrawing

Guides: Xenharmonic Functions

References:
_Anaphoria_
[1](https://www.anaphoria.com/wilsonintroMOS.html)
[2](https://www.anaphoria.com/hrgm.pdf),
_Xenharmonic_
[1](https://en.xen.wiki/w/MOS_scale)
