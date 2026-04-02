# recamanSequence

- _recamanSequence(n)_

Answer the first _n_ terms of Recamán’s sequence.
The _n_-the term is _a[n-1]-n_ if non-negative and not already in the sequence,
otherwise _a[n-1]+n_.

Recamán’s sequence,
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

Recamán’s sequence,
line plot,
OEIS [A005132](https://oeis.org/A005132):

~~~spl svg=A oeis=A005132
300.recamanSequence.linePlot
~~~

![](Help/Image/recamanSequence-A.svg)

Recamán’s sequence,
scatter plot,
OEIS [A005132](https://oeis.org/A005132):

~~~spl svg=B oeis=A005132
300.recamanSequence.scatterPlot
~~~

![](Help/Image/recamanSequence-B.svg)

Drawing connecting adjacent elements of Recamán’s sequence with arcs,
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

![](Help/Image/recamanSequence-C.svg)

A variant of Recamán’s sequence,
_k_ begins at _n_ and then flips signs and increments until a value is located,
OEIS [A064389](https://oeis.org/A064389):

~~~spl svg=D oeis=A064389
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

![](Help/Image/recamanSequence-D.svg)

Sign of first differences of Recamán’s sequence,
OEIS [A160357](https://oeis.org/A160357):

~~~spl svg=E oeis=A160357
100.recamanSequence
.differences
.sign
.discretePlot
~~~

![](Help/Image/recamanSequence-E.svg)

Height of terms of Recamán’s sequence,
OEIS [A064289](https://oeis.org/A064289):

~~~spl svg=F oeis=A064289
let r = 150.recamanSequence;
r.addFirst(0);
r.differences.sign.prefixSum.scatterPlot
~~~

![](Help/Image/recamanSequence-F.svg)

A variant of Recamán’s sequence,
OEIS [A063733](https://oeis.org/A063733):

~~~spl svg=G oeis=A063733
{ :a :n |
	let m = n - 1;
	let x = a[m] - m;
	(x > 0 & { a.includes(x).not } ).if {
		x
	} {
		a[m] + m
	}
}.recurrenceTable([1], 85)
.discretePlot
~~~

![](Help/Image/recamanSequence-G.svg)

First differences of Recamán’s sequence,
OEIS [A160356](https://oeis.org/A160356):

~~~spl svg=H oeis=A160356
115.recamanSequence
.differences
.discretePlot
~~~

![](Help/Image/recamanSequence-H.svg)

Indices of addition steps in Recamán’s sequence,
OEIS [A057165](https://oeis.org/A057165):

~~~spl svg=I oeis=A057165
115.recamanSequence
.differences
.detectIndices(isPositive:/1)
.discretePlot
~~~

![](Help/Image/recamanSequence-I.svg)

Indices of subtraction steps in Recamán’s sequence,
OEIS [A057166](https://oeis.org/A057166):

~~~spl svg=J oeis=A057166
115.recamanSequence
.differences
.detectIndices(isNegative:/1)
.discretePlot
~~~

![](Help/Image/recamanSequence-J.svg)

Partial sums of Recamán’s sequence,
OEIS [A065056](https://oeis.org/A065056):

~~~spl svg=K oeis=A065056
115.recamanSequence
.prefixSum
.discretePlot
~~~

![](Help/Image/recamanSequence-K.svg)

Term in Recamán’s sequence where _n_ appears for first time,
OEIS [A057167](https://oeis.org/A057167):

~~~spl svg=L oeis=A057167
let r = 181654.recamanSequence;
1:100.collect { :n |
	r.indexOf(n) - 1
}.scatterPlot.log
~~~

![](Help/Image/recamanSequence-L.svg)

Lengths of runs of alternating terms in the signs of the differences of Recamán’s sequence,
OEIS [A119632](https://oeis.org/A119632):

~~~spl svg=M oeis=A119632
let n = 2000;
let a = n.recamanSequence.differences.sign;
let b = [];
let c = 1;
2.toDo(n - 1) { :i |
	(a[i] = a[i - 1]).if {
		b.add(c);
		c := 1
	} {
		c := c + 1
	}
};
b.allButLast.discretePlot
~~~

![](Help/Image/recamanSequence-M.svg)

Record values in Recamáns sequence
OEIS [A064291](https://oeis.org/A064291):

~~~spl svg=N oeis=A064291
500.recamanSequence
.recordValues
.discretePlot
~~~

![](Help/Image/recamanSequence-N.svg)

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
