# fibonacciWordFractal

- _fibonacciWordFractal(n, θ)_

Answer the first _n_ terms of the Fibonacci word fractal,
given initial direction _θ_,
constructed by applying the odd–even drawing rule to the Fibonacci word.

_x_-coordinates of the Fibonacci word fractal,
OEIS [A332298](https://oeis.org/A332298):

~~~spl svg=A oeis=A332298
115.fibonacciWordFractal(0)
.column(1)
.discretePlot
~~~

![](Help/Image/fibonacciWordFractal-A.svg)

_y_-coordinates of the Fibonacci word fractal,
OEIS [A332299](https://oeis.org/A332299):

~~~spl svg=B oeis=A332299
115.fibonacciWordFractal(0)
.column(2)
.discretePlot
~~~

![](Help/Image/fibonacciWordFractal-B.svg)

The Fibonacci word fractal:

~~~spl svg=C
1000.fibonacciWordFractal(0)
.Line
~~~

![](Help/Image/fibonacciWordFractal-C.svg)

* * *

See also: fibonacciCurve, fibonacciWord

Guides: Integer Sequence Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_word_fractal)
