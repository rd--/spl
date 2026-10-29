# delay2

- _delay2(in)_

Two sample delay.

- in: sample to be delayed.

Original, with delayed subtracted from original:

~~~spl syn=A
let z = dust(1000);
[z, z - delay2(z)]
~~~

* * *

See also: delay1, delayC, delayL, delayN

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Delay2.html)

Categories: Ugen, Delay
