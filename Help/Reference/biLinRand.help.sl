# biLinRand

- _biLinRand(x)_

Noise generator, uniform random numbers between _-x_ and _+x_.

~~~spl syn=A
biLinRand(sinOsc(0.1, 0)) * 0.1
~~~

The below is only zero when _x_ is zero:

~~~spl syn=B
let n = biLinRand(sinOsc(1 / 2, 0)) * 0.1;
n.abs - n
~~~

Equivalent to:

~~~spl syn=C
whiteNoise() * sinOsc(0.1, 0) * 0.1
~~~

* * *

See also: linRand

Guides: Unit Generators

Categories: Math, Operator
