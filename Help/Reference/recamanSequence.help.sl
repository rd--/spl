# recamanSequence

- _recamanSequence(n)_

Answer the first _n_ terms of Recamáns sequence.
The _n_-the term is _a[n-1]-n_ if non-negative and not already in the sequence,
otherwise _a[n-1]+n_.

First few terms,
OEIS [A005132](https://oeis.org/A005132):

```
>>> 71.recamanSequence
[
	 0   1   3   6   2   7  13  20  12  21
	11  22  10  23   9  24   8  25  43  62
	42  63  41  18  42  17  43  16  44  15
	45  14  46  79 113  78 114  77  39  78
	38  79  37  80  36  81  35  82  34  83
	33  84  32  85  31  86  30  87  29  88
	28  89  27  90  26  91 157 224 156 225
	155
]
```

Line plot of the first few terms:

~~~spl svg=A
300.recamanSequence.linePlot
~~~

![](sw/spl/Help/Image/recamanSequence-A.svg)

Scatter plot of the first few terms:

~~~spl svg=B
300.recamanSequence.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-B.svg)

Drawing connecting adjacent elements with arcs,
radii are proportionate to distance:

~~~spl svg=C
let n = 30;
let x = n.recamanSequence;
2:n.collect { :i |
	let a = x[i - 1];
	let b = x[i];
	let c = (b - a) / 2;
	let r = c.abs;
	let cx = a + c;
	Arc(
		[cx 0],
		[r r],
		i.isEven.if { [0 1.pi] } { [1.pi 0] }
	)
}.LineDrawing
~~~

![](sw/spl/Help/Image/recamanSequence-C.svg)

A variant of the sequence,
_k_ begins at _n_ and then flips signs and increments until a value is located,
OEIS [A064389](https://oeis.org/A064389):

~~~spl svg=D
let m = 300;
let a = [1];
let d = IdentitySet(a);
2.toDo(m) { :n |
	let k = n;
	let x = nil;
	{
		x := a[n - 1] - k;
		k := (k > 0).if { -k } { -k + 1 };
		(x <= 0) | {
			d.includes(x)
		}
	}.whileTrue;
	a.add(x);
	d.add(x)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-D.svg)

Sign of first differences of Recamán’s sequence,
OEIS [A160357](https://oeis.org/A160357):

~~~spl svg=E
100.recamanSequence
.differences
.sign
.discretePlot
~~~

![](sw/spl/Help/Image/recamanSequence-E.svg)

Height of terms of Recamán’s sequence,
OEIS [A064289](https://oeis.org/A064289):

~~~spl svg=F
let r = 150.recamanSequence;
r.addFirst(0);
r.differences.sign.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-F.svg)

* * *

See also: Set

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RecamansSequence.html),
_OEIS_
[1](https://oeis.org/A005132),
_W_
[1](https://en.wikipedia.org/wiki/Recam%C3%A1n%27s_sequence)

Categories: Math, Sequence
