# eulerGradusSuavitatis

- _eulerGradusSuavitatis(anInteger)_

Euler’s _Gradus Suavitatis_, or degree of harmoniousness, consonance or pleasantness.

At `Integer`:

```
>>> 45.eulerGradusSuavitatis
(5 + 3 + 3) - (3 - 1)

>>> 126.eulerGradusSuavitatis
(2 + 3 + 3 + 7) - (4 - 1)
```

At `Fraction`:

```
>>> 3/2.eulerGradusSuavitatis
(3 + 2 - (2 - 1))

>>> 9/8.eulerGradusSuavitatis
(3 + 3) + (2 + 2 + 2) - (5 - 1)

>>> 15/16.eulerGradusSuavitatis
(5 + 3 + 2 + 2 + 2 + 2) - (6 - 1)
```

Select integers with gradus suavitatis value less than seven:

```
>>> 1:99.select { :each |
>>> 	each.eulerGradusSuavitatis < 7
>>> }
[1 2 3 4 5 6 8 9 10 12 16 18 24 32]
```

Threads over lists:

```
>>> 1:19.eulerGradusSuavitatis
[1 2 3 3 5 4 7 4 5 6 11 5 13 8 7 5 17 6 19]
```

Plot:

~~~spl svg=A
1:99.eulerGradusSuavitatis.linePlot
~~~

![](sw/spl/Help/Image/eulerGradusSuavitatis-A.svg)

* * *

See also: Fraction, isCoprime, primeFactors

Guides: Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A275314)

Further Reading: Euler 1739

Categories: Tuning
