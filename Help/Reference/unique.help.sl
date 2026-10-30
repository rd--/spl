# unique

- _unique([x₁ x₂ …], =)_

Answer the same values as in the collection _x_,
but with no repetitions according to _=_,
and in sorted order.

```
>>> [1 1 2 1 2 3 1 2 3 4]
>>> .unique(==)
[1 2 3 4]

>>> [9 2 9 5].unique(==)
[2 5 9]

>>> ['3' '2' '1' '2' '3']
>>> .unique(==)
['1' '2' '3']

>>> [0J1 0J0 2J0 1J0 0J2].unique(=)
[0J0 0J1 0J2 1J0 2J0]
```

_a_ places each item of _b_ into on of three categories,
group _b_ according to these categories,
the meaning of the verb _/._ in _J_:

```
>>> let a = [1 2 3 1 3 2 1];
>>> let b = [0 1 2 3 4 5 6];
>>> let c = a.unique(==);
>>> let d = c.collect { :x |
>>> 	a.indicesOf(x)
>>> };
>>> d.collect { :x |
>>> 	b.atAll(x)
>>> }
[0 3 6; 1 5; 2 4]
```

Unique digits used in _n_ in numerical order,
OEIS [A180410](https://oeis.org/A180410):

~~~spl svg=A oeis=A180410
1:150.collect { :n |
	n.integerDigits
	.unique(==)
	.fromDigits
}.scatterPlot
~~~

![](Help/Image/unique-A.svg)

Fermi-Dirac primes,
numbers of the form _p^(2^k)_ where _p_ is prime and _k≥0_,
OEIS [A050376](https://oeis.org/A050376):

~~~spl svg=B oeis=A050376
let m = 300;
let t = [];
let k = 1;
let n = nil;
{
	n := m ^ (1 / k);
	n > 2
}.whileTrue {
	t.addAll!(2:n.primePi.prime ^ k);
	k := 2 * k
};
t.unique(==).scatterPlot
~~~

![](Help/Image/unique-B.svg)

A construction by Clark Kimberling,
OEIS [A030747](https://oeis.org/A030747)
and
OEIS [A030748](https://oeis.org/A030748):

~~~spl svg=C oeis=A030747
let a = [4];
let b = [];
16.timesRepeat {
	let c = (a ++ b);
	let d = c.unique(==);
	let e = Multiset(c, ==).sortedElements;
	let f = e.collect(value/1);
	b.addAll!(d);
	a.addAll!(f)
};
PlotSet(
	[a b].collect(scatterPlot/1),
	[2 1]
)
~~~

![](Help/Image/unique-C.svg)

Exponent of five (value of j) in _n_-th number of form _3^i*5^j_,
OEIS [A022337](https://oeis.org/A022337):

~~~spl svg=D oeis=A022337
let s = [];
let m = 11;
0:m.do { :k |
	let n = 5 ^ k;
	{ n <= (5 ^ m) }.whileTrue {
		s.add!(n);
		n := n * 3
	}
};
s.unique(==)
.integerExponent(5)
.discretePlot
~~~

![](Help/Image/unique-D.svg)

* * *

See also: ++, deleteDuplicates, nub, sort, uniqueElements

Guides: List Functions, Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Union.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.unique.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.unique.html)
