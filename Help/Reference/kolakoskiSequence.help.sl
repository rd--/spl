# kolakoskiSequence

- _kolakoskiSequence(n, i=[1 2])_

Answer the first _n_ terms of the Kolakoski sequence,
also called the Oldenburger-Kolakoski sequence.

First few terms of the _1,2_ Kolakoski sequence,
OEIS [A000002](https://oeis.org/A000002):

```
>>> 108.kolakoskiSequence
[
	1 2 2 1 1 2 1 2 2 1
	2 2 1 1 2 1 1 2 2 1
	2 1 1 2 1 2 2 1 1 2
	1 1 2 1 2 2 1 2 2 1
	1 2 1 2 2 1 2 1 1 2
	1 1 2 2 1 2 2 1 1 2
	1 2 2 1 2 2 1 1 2 1
	1 2 1 2 2 1 2 1 1 2
	2 1 2 2 1 1 2 1 2 2
	1 2 2 1 1 2 1 1 2 2
	1 2 1 1 2 1 2 2
]
```

Partial sums of the _1,2_ Kolakoski sequence,
OEIS [A054353](https://oeis.org/A054353):

```
>>> 16.kolakoskiSequence.prefixSum
[1 3 5 6 7 9 10 12 14 15 17 19 20 21 23 24]
```

The _1,2_ Kolakoski sequence,
OEIS [A000002](https://oeis.org/A000002):

~~~spl svg=A oeis=A000002
37.kolakoskiSequence
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-A.svg)

The _1,2_ Kolakoski sequence,
OEIS [A000002](https://oeis.org/A000002),
minus one so that terms are `zero` and `one`:

~~~spl svg=B oeis=A000002 offset
(85.kolakoskiSequence - 1)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-B.svg)

A direct form for the offset Kolakoski sequence,
with an additional two leading terms,
OEIS [A123594](https://oeis.org/A123594):

~~~spl svg=C oeis=A123594
let a = [1 1 0];
let i = 3;
{
	i <= 57
}.whileTrue {
	let t = a[i];
	let e = a.last;
	(t = 0).if {
		a.add(1 - e)
	} {
		a.add(e);
		a.add(1 - e)
	};
	i := i + 1
};
a.discretePlot
~~~

![](Help/Image/kolakoskiSequence-C.svg)

The _1,3_ Kolakoski sequence,
OEIS [A064353](https://oeis.org/A064353),
minus one:

~~~spl svg=D oeis=A064353 offset
(85.kolakoskiSequence([1 3]) - 1)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-D.svg)

The _2,3_ Kolakoski sequence,
OEIS [A071820](https://oeis.org/A071820),
minus two:

~~~spl svg=E oeis=A071820 offset
(107.kolakoskiSequence([2 3]) - 2)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-E.svg)

Let _a(n)_ be the prefix sum of the Kolakoski sequence,
_3n - 2a(n)_,
OEIS [A088568](https://oeis.org/A088568):

~~~spl svg=F oeis=A088568
let n = 115;
let a = n.kolakoskiSequence.prefixSum;
((3 * 1:n) - (2 * a)).discretePlot
~~~

![](Help/Image/kolakoskiSequence-F.svg)

Count ones in the Kolakoski sequence,
OEIS [A156077](https://oeis.org/A156077):

~~~spl svg=G oeis=A156077
let n = 65;
let a = n.kolakoskiSequence.prefixSum;
((2 * 1:n) - a).stepPlot
~~~

![](Help/Image/kolakoskiSequence-G.svg)

First differences of Kolakoski sequence,
OEIS [A054354](https://oeis.org/A054354):

~~~spl svg=H oeis=A054354
115.kolakoskiSequence
.differences
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-H.svg)

Second differences of Kolakoski sequence,
OEIS [A376604](https://oeis.org/A376604):

~~~spl svg=I oeis=A376604
115.kolakoskiSequence
.differences(2)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-I.svg)

The _1,4_ Kolakoski sequence,
OEIS [A071907](https://oeis.org/A071907),
minus one:

~~~spl svg=J oeis=A071907 offset
(105.kolakoskiSequence([1 4]) - 1)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-J.svg)

The _2,4_ Kolakoski sequence,
OEIS [A071928](https://oeis.org/A071928),
minus two:

~~~spl svg=K oeis=A071928 offset
(105.kolakoskiSequence([2 4]) - 2)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-K.svg)

The _3,4_ Kolakoski sequence,
OEIS [A071942](https://oeis.org/A071942),
minus three:

~~~spl svg=L oeis=A071942 offset
(105.kolakoskiSequence([3 4]) - 3)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-L.svg)

The _1,3_ Kolakoski sequence,
OEIS [A362927](https://oeis.org/A362927),
minus two:

~~~spl svg=M oeis=A362927 offset
(85.kolakoskiSequence([1 3]) - 2)
.discretePlot
~~~

![](Help/Image/kolakoskiSequence-M.svg)

* * *

See also: golombsSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KolakoskiSequence.html),
_OEIS_
[1](https://oeis.org/A000002),
_W_
[1](https://en.wikipedia.org/wiki/Kolakoski_sequence)
