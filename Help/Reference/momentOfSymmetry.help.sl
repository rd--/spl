# momentOfSymmetry

- _momentOfSymmetry(generator, period, maxDepth)_

Answer the sequence of moment of symmetry scales specified by a _generator_ and a _period_.
The sequence ends when the next step would have only one interval size,
according to `~`,
or when _maxDepth_, which may be omitted, is reached.

The diatonic scale is the last item in the _5/12_ sequence:

```
>>> 5.momentOfSymmetry(12)
[
	5 7;
	5 5 2;
	3 2 3 2 2;
	1 2 2 1 2 2 2
]
```

Each of the scales given is a moment of symmetry scale:

```
>>> 5.momentOfSymmetry(12)
>>> .allSatisfy { :each |
>>> 	each.asScale.isMomentOfSymmetry
>>> }
true
```

The size of the scale at each step:

```
>>> 5.momentOfSymmetry(12)
>>> .collect(size:/1)
[2 3 5 7]
```

The symmetrical generator is _7/12_:

```
>>> 7.momentOfSymmetry(12)
[
	7 5;
	2 5 5;
	2 2 3 2 3;
	2 2 2 1 2 2 1
]
```

The interval pairs only of the _41/58_ sequence:

```
>>> 41.momentOfSymmetry(58)
>>> .collect(nub:/1)
[
	41 17;
	24 17;
	7 17;
	7 10;
	7 3;
	4 3;
	1 3;
	1 2
]
```

The fifth level of the _41/58_ sequence:

```
>>> 41.momentOfSymmetry(58).at(5)
[7 7 7 3 7 7 3 7 7 3]
```

_6L1s_ and _1L6s_ scales:

```
>>> 11.momentOfSymmetry(13).last
[1 2 2 2 2 2 2]

>>> 1.momentOfSymmetry(7).last
[1 1 1 1 1 2]
```

_5L2s_ and _2L5s_ scales:

```
>>> 7.momentOfSymmetry(12).last
[2 2 2 1 2 2 1]

>>> 4.momentOfSymmetry(9).last
[2 1 1 2 1 1 1]
```

The interval pairs only of the _22/49_ sequence:

```
>>> 22.momentOfSymmetry(49)
>>> .collect(nub:/1)
[
	22 27;
	22 5;
	17 5;
	12 5;
	7 5;
	2 5;
	2 3;
	2 1
]
```

The _58.33/100_ sequence, rounded:

```
>>> 58.3333.momentOfSymmetry(100)
>>> .rounded
[
	58 42;
	17 42 42;
	17 17 25 17 25;
	17 17 17 8 17 17 8
]
```

The `prefixSum` of each scale tells the pitches of the scale,
concluding with the period:

```
>>> 5.momentOfSymmetry(12)
>>> .collect(prefixSum:/1)
[
	5 12;
	5 10 12;
	3 5 8 10 12;
	1 3 5 6 8 10 12
]
```

`nubCumulatively` indicates which pitches are introduced at each level:

```
>>> 5.momentOfSymmetry(12)
>>> .collect(prefixSum:/1)
>>> .nubCumulatively
[5 12; 10; 3 8; 1 6]
```

`horogramDrawing` answers a line drawing of a circular Wilson horogram showing the scale structure.
`zero`,
and equivalently the period,
points upwards and intervals increase clockwise:

~~~spl svg=A
7.momentOfSymmetry(12)
.horogramDrawing
~~~

![](sw/spl/Help/Image/momentOfSymmetry-A.svg)

An outer ring of the least step equally dividing the period can be appended before drawing:

~~~spl svg=B
let appendOuterRing = { :mos |
	let period = mos.anyOne.sum;
	let leastStep = mos.last.min;
	let k = (period / leastStep).rounded;
	mos ++ [leastStep # k]
};
7.momentOfSymmetry(12)
.appendOuterRing
.horogramDrawing
~~~

![](sw/spl/Help/Image/momentOfSymmetry-B.svg)

A moment of symmetry with a generator derived as the phi-weighted mediant of _1/5_ and _3/14_,
considered to a depth of nine places:

~~~spl svg=C
1/5.phiWeightedMediant(3/14)
.momentOfSymmetry(1, 9)
.horogramDrawing
~~~

![](sw/spl/Help/Image/momentOfSymmetry-C.svg)

`rectangularHorogramDrawing` answers a line drawing of a rectangular Wilson horogram showing the scale structure.
`zero` is at the left,
intervals increase rightwards until the period,
which is at the right,
and rows are descending:

~~~spl svg=D
7.momentOfSymmetry(12)
.rectangularHorogramDrawing
~~~

![](sw/spl/Help/Image/momentOfSymmetry-D.svg)

A rectangular drawing of the same phi-weighted mediant scale as above:

~~~spl svg=E
1/5.phiWeightedMediant(3/14)
.momentOfSymmetry(1, 9)
.rectangularHorogramDrawing
~~~

![](sw/spl/Help/Image/momentOfSymmetry-E.svg)

`horogramTable` answers a `Html` table of a rectangular Wilson horogram showing the scale structure.
Requires that the scale have only integer step sizes.

~~~
7.momentOfSymmetry(12)
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

See also: bjorklundsAlgorithm, horogramDrawing, horogramTable, isMomentOfSymmetry, momentOfSymmetryPattern, nubCumulatively, prefixSum, rectangularHorogramDrawing, Scale

References:
_Anaphoria_
[1](https://www.anaphoria.com/wilsonintroMOS.html)
[2](https://www.anaphoria.com/hrgm.pdf),
_Xenharmonic_
[1](https://en.xen.wiki/w/MOS_scale)
