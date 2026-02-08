# count

- _count(c, f:/1)_

Evaluate the unary block _f_ with each of the elements of the collection _c_ as the argument.
Answer the number of elements that answered `true`.

At `Range`:

```
>>> 1:9.count(isEven:/1)
4
```

At `List`:

```
>>> [1 .. 9].count(isEven:/1)
4
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).count(isEven:/1)
1
```

Count the number of items in a random list of 100 numbers that are greater than 0.5:

```
>>> let l = Sfc32(98765).next(100);
>>> l.count { :each |
>>> 	each > 0.5
>>> }
48
```

Count the number of rows whose first element is 1:

```
>>> [1 2; 2 3; 1 5].count { :each |
>>> 	each.first = 1
>>> }
2
```

Plot the number of anti-divisors of _n_,
OEIS [A066272](https://oeis.org/A066272):

~~~spl svg=A
1:150.collect { :n |
	let m = n - 1;
	2:m.count { :x |
		((n % x) - (x / 2)).abs < 1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/count-A.svg)

* * *

See also: counts, occurrencesOf, select

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Count.html),
_OEIS_
[1](https://oeis.org/A066272)

Categories: Enumerating
