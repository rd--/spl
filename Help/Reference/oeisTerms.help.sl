# oeisTerms

- _oeisTerms(s, k)_

Answer the first _k_ terms of the OEIS sequence _s_.

The number of times _n_ appears in the Conway sequence
OEIS [A004001](https://oeis.org/A004001),
OEIS [A051135](https://oeis.org/A051135):

~~~spl svg=A oeis=A051135
let n = 55;
let m = (n + 2) * 2;
let a = 'A004001'.oeisTerms(m);
let b = List(a.max, 0);
a.do { :i |
	b[i] := b[i] + 1
};
b.first(n).discretePlot
~~~

![](sw/spl/Help/Image/oeisTerms-A.svg)

Ordinal transform of
OEIS [A265332](https://oeis.org/A265332),
which is
OEIS [A051135](https://oeis.org/A051135)
with the first place set to `one`,
OEIS [A162598](https://oeis.org/A162598):

~~~spl svg=B oeis=A162598
let a = 'A051135'.oeisTerms(200);
a[1] := 1;
a.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/oeisTerms-B.svg)

* * *

See also: OeisEntry, oeisFunction

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org)
