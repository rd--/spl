# linearRecurrence

- _linearRecurrence(k, i, n)_

Answer the sequence of length _n_ obtained by iterating the linear recurrence with kernel _k_ starting with initial values _i_.

Solve an initial-value problem for a first-order difference equation with kernel _(-3, 1)_:

```
>>> linearRecurrence([-3 1], [7 2], 10)
[7 2 1 -1 4 -13 43 -142 469 -1549]
```

Find the first few Fibonacci numbers:

```
>>> linearRecurrence([1 1], [1, 1], 10)
[1 1 2 3 5 8 13 21 34 55]
```

`linearRecurrence` works if _i_ is a matrix:

```
>>> linearRecurrence([1 1], [1 2; 2 1], 10)
[
	1 2; 2 1; 3 3; 5 4; 8 7; 13 11;
	21 18; 34 29; 55 47; 89 76
]
```

`linearRecurrence` works if _k_ and _i_ are both matrices:

```
>>> linearRecurrence(
>>> 	[1 1; 0 1:; 1 0; -1 1],
>>> 	[1 2; 2 1],
>>> 	6
>>> )
[1 2; 2 1; 4 2; 8 1; 13 -1; 20 -8]
```

Padovan sequence, OEIS [A000931](http://oeis.org/A000931):

```
>>> linearRecurrence([0 1 1], [1 1 1], 10)
[1 1 1 2 2 3 4 5 7 9]
```

Lucas numbers, OEIS [A000204](http://oeis.org/A000204):

```
>>> linearRecurrence([1 1], [1 3], 10)
[1 3 4 7 11 18 29 47 76 123]
```

Pell numbers, OEIS [A000129](http://oeis.org/A000129):

```
>>> linearRecurrence([2 1], [0 1], 10)
[0 1 2 5 12 29 70 169 408 985]
```

Pell–Lucas numbers, OEIS [A002203](http://oeis.org/A002203):

```
>>> linearRecurrence([2 1], [2 2], 10)
[2 2 6 14 34 82 198 478 1154 2786]
```

Perrin sequence, OEIS [A001608](http://oeis.org/A001608):

```
>>> linearRecurrence([0 1 1], [3 0 2], 10)
[3 0 2 3 2 5 5 7 10 12]
```

Draw spiral:

~~~spl svg=A
let k = [(1.pi.i / 2.sqrt).exp, 1.i] / 1.1;
let i = [1, 1];
linearRecurrence(k, i, 100)
.collect(realImaginary:/1)
.Line
~~~

![](sw/spl/Help/Image/linearRecurrence-A.svg)

* * *

See also: shiftRegisterSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LinearRecurrenceEquation.html)
[2](https://reference.wolfram.com/language/ref/LinearRecurrence.html),
_OEIS_
[1](http://oeis.org/A000931)
[2](http://oeis.org/A000204)
[3](http://oeis.org/A000129)
[4](http://oeis.org/A002203)
[5](http://oeis.org/A001608),
_W_
[1](https://en.wikipedia.org/wiki/Recurrence_relation)

Categories: Math, Sequence
