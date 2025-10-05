# Integer Sequences

Scatter plot of every fourth item of the first few terms of OEIS [A063543](https://oeis.org/A063543):

~~~spl svg=A
1:4:1000.collect { :n |
	let d = n.integerDigits;
	n - d.reject(isZero:/1).product
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-A.svg>)

Scatter plot of the first few terms of OEIS [A117966](https://oeis.org/A117966):

~~~spl svg=B
0:123.collect { :i |
	i.integerDigits(3).collect { :n |
		(n = 2).if { -1 } { n }
	}.fromDigits(3)
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-B.svg>)

Scatter plot of the first few terms of OEIS [A265326](https://oeis.org/A265326):

~~~spl svg=C
1:60.collect { :n |
	let m = n.prime;
	let d = m.integerDigits(2);
	m - d.reverse.fromDigits(2)
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-C.svg>)

Scatter plot of the first _k_ terms of OEIS [A342585](https://oeis.org/A342585):

~~~spl svg=D
let k = 200;
let a = [];
let c = 0;
let n = 0;
let f = 1.toDo(k) { :i |
	let n = a.occurrencesOf(c);
	a.add(n);
	(n = 0).if {
		c := 0
	} {
		c := c + 1
	}
};
a.collect { :n |
	n.isZero.if { 0 } { n.log }
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-D.svg>)

List of help files that include references to OEIS integer sequences:

- `Integer Sequence Functions`

* * *

Guides: Magic Squares, Mathematical Sequences

References:
_W_
[1](https://en.wikipedia.org/wiki/Sequence)
[2](https://en.wikipedia.org/wiki/Automatic_sequence)
