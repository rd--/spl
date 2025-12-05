# lehmerGenerator

- _lehmerGenerator([a m], s)_

Answer a `Stream` implementing a Lehmer random number generator with multiplier _a_, modulus _m_ and seed _s_.

Implement the Park-Miller generator,
which is correct when caculated with 64-bit IEEE floating point math:

~~~spl svg=A
let a = 48271;
let m = 2 ^ 31 - 1;
let s = 791823;
[a m].lehmerGenerator(s)
.next(100).discretePlot
~~~

![](sw/spl/Help/Image/lehmerGenerator-A.svg)


~~~spl svg=C
let n = 150;
let a = 1.goldenRatio % 1;
let b = 1.silverRatio % 1;
let x = lehmerGenerator([a 1], 1, n); x.linePlot

let y = { :n | (n + b) % 1 }.nestList(0, n);
[x y].transpose.scatterPlot
~~~

* * *

See also: RandomNumberGenerator

Guides: Random Number Generators

References:
_W_
[1](https://en.wikipedia.org/wiki/Lehmer_random_number_generator)

Further Reading: Park Miller 1988
