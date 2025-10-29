# Integer Sequences

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
