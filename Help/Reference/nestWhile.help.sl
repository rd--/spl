# nestWhile

- _nestWhile(f:/1, i, g:/1)_

Answer the result of applying the block _f_ repeatedly,
starting with the value _i_,
and continuing until applying the predicate block _g_ to the result no longer yields `true`.

Keep dividing by 2 until the result is no longer an even number:

```
>>> { :x |
>>> 	x / 2
>>> }.nestWhile(123456, isEven:/1)
1929
```

Iterate taking logarithms until the result is no longer positive:

```
>>> log:/1.nestWhile(100, isPositive:/1)
100.log.log.log.log
```

Find the next prime after 888:

```
>>> { :x |
>>> 	x + 1
>>> }.nestWhile(888) { :x |
>>> 	x.isPrime.not
>>> }
907
```

Plot Kimberling’s paraphrase of the binary number system,
OEIS [A003602](https://oeis.org/A003602):

~~~spl svg=A
1:200.collect { :n |
	let a = { :x |
		(x / 2).floor
	}.nestWhile(n, isEven:/1);
	(a / 2).ceiling
}.scatterPlot
~~~

![](sw/spl/Help/Image/nestWhile-A.svg)

* * *

See also: fixedPoint, nestWhileList, scan, takeWhile, whileTrue

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NestWhile.html),
_OEIS_
[1](https://oeis.org/A003602)
