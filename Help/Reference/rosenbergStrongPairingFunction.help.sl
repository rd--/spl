# rosenbergStrongPairingFunction

- _rosenbergStrongPairingFunction([x y])_

Implement the Rosenberg-Strong pairing function.

Pair and unpair non-negative integers:

```
>>> [47 32]
>>> .rosenbergStrongPairingFunction
2271

>>> 2271
>>> .inverseRosenbergStrongPairingFunction
[47 32]

>>> [52 1]
>>> .rosenbergStrongPairingFunction
2807

>>> 2807
>>> .inverseRosenbergStrongPairingFunction
[52 1]
```

Threads over lists:

```
>>> [0 0; 0 1; 1 1; 1 0; 0 2; 1 2]
>>> .rosenbergStrongPairingFunction
[0 1 2 3 4 5]

>>> 0:5
>>> .inverseRosenbergStrongPairingFunction
[0 0; 0 1; 1 1; 1 0; 0 2; 1 2]
```

Inverse Rosenberg-Strong pairing function:

~~~spl svg=A
0:65.rosenbergStrongPairingFunction.Line
~~~

![](Help/Image/rosenbergStrongPairingFunction-A.svg)

_x_-coordinates of inverse Rosenberg-Strong pairing function:

~~~spl svg=B
0:65
.inverseRosenbergStrongPairingFunction
.column(1)
.discretePlot
~~~

![](Help/Image/rosenbergStrongPairingFunction-B.svg)

_y_-coordinates of inverse Rosenberg-Strong pairing function:

~~~spl svg=C
0:65
.inverseRosenbergStrongPairingFunction
.column(2)
.discretePlot
~~~

![](Help/Image/rosenbergStrongPairingFunction-C.svg)

* * *

See also: cantorPairingFunction

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PairingFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Pairing_function)
