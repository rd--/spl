# tRand

- _tRand(lo=0, hi=1, trig=0)_

Triggered random number generator.
Generates a random float value in uniform distribution from _lo_ to _hi_ each time the _trig_ is set.

~~~spl syn=A
let tr = dust(10);
sinOsc(tRand(300, 3000, tr), 0) * 0.1
~~~

Mouse controls density:

~~~spl syn=B
let tr = dust(mouseX(1, 8000, 1, 0.2));
sinOsc(tRand(300, 3000, tr), 0) * 0.1
~~~

* * *

See also: iRand, rand, tiRand

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TRand.html)

Categories: Ugen
