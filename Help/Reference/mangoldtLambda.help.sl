# mangoldtLambda

- _mangoldtLambda(n)_

Answer the von Mangoldt function _Λ(n)_.

Compute the Mangoldt function:

```
>>> 25.mangoldtLambda
5.log

>>> 125.mangoldtLambda
5.log
```

Answers `zero` except for prime powers:

```
>>> (2 * 3).mangoldtLambda
0

>>> (2 ^ 3).mangoldtLambda
2.log
```

Use `lcm` to compute Mangoldt lambda:

```
>>> (1:5.lcm / 1:4.lcm).log
5.log

>>> 5.mangoldtLambda
5.log
```

Plot the Mangoldt lambda sequence for the first few numbers:

~~~spl svg=A
1:100.collect(mangoldtLambda:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/mangoldtLambda-A.svg)

Plot `exp` of the Mangoldt lambda sequence for the first few numbers:

~~~spl svg=B
1:100.collect(mangoldtLambda:/1)
.exp.stepPlot
~~~

![](sw/spl/Help/Image/mangoldtLambda-B.svg)

Plot Mangoldt lambda for the sum of two squares:

~~~spl png=C
let m = { :a :b |
	((a ^ 2) + (b ^ 2)).mangoldtLambda
}.table(1:50, 1:50);
(1 - m.rescale).Greymap
~~~

![](sw/spl/Help/Image/mangoldtLambda-C.png)

* * *

See also: factorInteger, isPrimePower, moebiusMu, primePi

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MangoldtFunction.html)
[2](https://reference.wolfram.com/language/ref/MangoldtLambda.html),
_OEIS_
[1](https://oeis.org/A014963),
_W_
[1](https://en.wikipedia.org/wiki/Von_Mangoldt_function)

Unicode: U+039B Λ Greek Capital Letter Lamda
