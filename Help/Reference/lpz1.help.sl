# lpz1

- _lpz1(in)_

Two point average filter.
A special case fixed filter.
Implements the formula:

> _out[i] = 0.5 * (in[i] + in[i - 1])_

Compare:

~~~spl syn=A
whiteNoise() * 0.1
~~~

and:

~~~spl syn=B
lpz1(whiteNoise() * 0.1)
~~~

* * *

See also: hpz1, hpz2, lpz2

Guides: Unit Generators

References:
_Csound_
[1](http://csound.com/docs/manual/integ.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LPZ1.html)

Categories: Ugen
