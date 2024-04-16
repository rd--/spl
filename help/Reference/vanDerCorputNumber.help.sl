# vanDerCorputNumber

- _vanDerCorputNumber(n, base)_

A van der Corput sequence is a low-discrepancy sequence over the unit interval,
first published in 1935 by the Dutch mathematician J. G. van der Corput.

Binary van der Corput sequence:

```
>>> 0:9.vanDerCorputNumber(2)
[0 1/2 1/4 3/4 1/8 5/8 3/8 7/8 1/16 9/16]

>>> 0:19.vanDerCorputNumber(2).collect(numerator:/1)
[0 1 1 3 1 5 3 7 1 9 5 13 3 11 7 15 1 17 9 25]
```

Ternary van der Corput sequence:

```
>>> 0:9.vanDerCorputNumber(3)
[0 1/3 2/3 1/9 4/9 7/9 2/9 5/9 8/9 1/27]

>>> 0:19.vanDerCorputNumber(3).collect(numerator:/1)
[0 1 2 1 4 7 2 5 8 1 10 19 4 13 22 7 16 25 2 11]
```

Quaternary van der Corput sequence:

```
>>> 0:9.vanDerCorputNumber(4)
[0 1/4 1/2 3/4 1/16 5/16 9/16 13/16 1/8 3/8]
```

Plot decimal sequence:

~~~
1:500.vanDerCorputNumber(10).asFloat.plot
~~~

Plot numerators of decimal sequence:

~~~
1:500.vanDerCorputNumber(10).collect(numerator:/1).plot
~~~

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/vanderCorputSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Van_der_Corput_sequence)
