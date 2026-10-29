# lpz2

- _lpz2(in)_

Two zero fixed lowpass.
A special case fixed filter.
Implements the formula:

> _out[i] = 0.25 * (in[i] + (2 * in[i - 1]) + in[i - 2])_

Compare:

~~~spl syn=A
whiteNoise() * 0.1
~~~

and:

~~~spl syn=B
lpz2(whiteNoise() * 0.1)
~~~

* * *

See also: hpz2, lpz1

Guides: Unit Generators

Categories: Ugen
