# selfCountingNumber

- _selfCountingNumber(k)_

Answer _k_-th term of the self-counting sequence.

```
>>> 23.selfCountingNumber
7
```

The self-counting sequence,
OEIS [A002024](https://oeis.org/A002024):

```
>>> 1:15.collect(selfCountingNumber:/1)
[1 2 2 3 3 3 4 4 4 4 5 5 5 5 5]
```

As triangle:

```
>>> 1:5.triangularArray { :i :j | i }
[1; 2 2; 3 3 3; 4 4 4 4; 5 5 5 5 5]
```

The self-counting sequence,
OEIS [A002024](https://oeis.org/A002024):

~~~spl svg=A oeis=A002024
1:85.collect(selfCountingNumber:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/selfCountingNumber-A.svg)

* * *

See also: selfCountingSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Self-CountingSequence.html),
_OEIS_
[1](https://oeis.org/A002024)
