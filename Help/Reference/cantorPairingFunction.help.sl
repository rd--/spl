# cantorPairingFunction

- _cantorPairingFunction([x y])_

Implement the Cantor pairing function.

Pair and unpair non-negative integers:

```
>>> [47 32].cantorPairingFunction
3192

>>> 3192.inverseCantorPairingFunction
[47 32]

>>> [52 1].cantorPairingFunction
1432

>>> 1432.inverseCantorPairingFunction
[52 1]
```

Threads over lists:

```
>>> [0 0; 1 0; 0 1; 2 0; 1 1; 0 2]
>>> .cantorPairingFunction
[0 1 2 3 4 5]

>>> 0:5.inverseCantorPairingFunction
[0 0; 1 0; 0 1; 2 0; 1 1; 0 2]
```

Inverse Cantor pairing function:

~~~spl svg=A
0:65.inverseCantorPairingFunction.Line
~~~

![](Help/Image/cantorPairingFunction-A.svg)

_x_-coordinates of inverse Cantor pairing function,
OEIS [A025581](https://oeis.org/A025581):

~~~spl svg=B oeis=A025581
0:65.inverseCantorPairingFunction
.column(1)
.discretePlot
~~~

![](Help/Image/cantorPairingFunction-B.svg)

_y_-coordinates of inverse Cantor pairing function,
OEIS [A002262](https://oeis.org/A002262):

~~~spl svg=C oeis=A002262
0:65.inverseCantorPairingFunction
.column(2)
.discretePlot
~~~

![](Help/Image/cantorPairingFunction-C.svg)

* * *

See also: rosenbergStrongPairingFunction

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PairingFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Pairing_function)
