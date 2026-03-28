# whileTrue

- _whileTrue(condition:/0, f:/0)_

Conditional evaluation.
Evaluate the block _f_ as long as the value of the block _condition_ is `true`.
In the unary case, simply evaluate _condition_ repeatedly as long as it answers `true`.

Ordinarily _condition_ and _f_ are literal no-argument blocks written using `Trailing Block Syntax`.

Calculate an initial subsequence of the Fibonacci series,
the sum of two elements defines the next:

```
>>> let answer = [];
>>> let a = 0;
>>> let b = 1;
>>> { b < 1000 }.whileTrue {
>>> 	answer.add(b);
>>> 	[a, b] := [b, a + b]
>>> };
>>> answer
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987
]
```

The minimal absolute difference between _n_ and each of the powers of the previous terms,
OEIS [A322522](https://oeis.org/A322522):

~~~spl svg=A oeis=A322522
let comparePowers = { :n :m |
	(n <= 1).if {
		m - n
	} {
		let a = n;
		{
			a < m
		}.whileTrue {
			a := a * n
		};
		(m - (a / n)).min(a - m)
	}
};
let a = [1];
let b = [1];
150.timesRepeat {
	a.add(
		b.collect { :n |
			let m = a.size + 1;
			n.comparePowers(m)
		}.min
	);
	(a.last > b.last).ifTrue {
		b.add(a.last)
	}
};
a.scatterPlot
~~~

![](Help/Image/whileTrue-A.svg)

A self-describing sequence made of strings of consecutive integers,
OEIS [A113138](https://oeis.org/A113138):

~~~spl svg=B oeis=A113138
let k = 100;
let a = List(k);
let n = 0;
let m = -1;
let notice = { :v |
	n := n + 1;
	m := v;
	(n <= k).ifTrue {
		a[n] := v
	}
};
let r = 1;
{ n < k }.whileTrue {
	let x = (m = 1).if { 3 } { 1 };
	notice(x);
	1.toDo(a[r] - 1) { :j |
		notice(x + j)
	};
	r := r + 1
};
(a - 1).discretePlot
~~~

![](Help/Image/whileTrue-B.svg)

The number of Mancala numbers _≤n-1_,
OEIS [A082447](https://oeis.org/A082447):

~~~spl svg=C oeis=A082447
1:65.collect { :n |
	let s = n;
	let c = 1;
	{
		s - (s % c) > 0
	}.whileTrue {
		s := s - (s % c);
		c := c + 1
	};
	c - 1
}.discretePlot
~~~

![](Help/Image/whileTrue-C.svg)

Least _k_ such that _k³⌊(x(k-1)/k³)_ is zero,
OEIS [A082528](https://oeis.org/A082528):

~~~spl svg=D oeis=A082528
0:115.collect { :n |
	let s = n;
	let c = 1;
	{
		s - (s % (c ^ 3)) > 0
	}.whileTrue {
		s := s - (s % (c ^ 3));
		c := c + 1
	};
	c
}.stepPlot
~~~

![](Help/Image/whileTrue-D.svg)

* * *

See also: doWhileTrue, if, ifFalse, ifNil, ifTrue, whileFalse

Guides: Control Functions, Iteration Functions

References:
_Smalltalk_
5.4.2.5
5.4.2.6

Categories: Evaluating
