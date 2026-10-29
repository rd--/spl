# diwhite

- _diwhite(length=Infinity, lo=0, hi=1)_

demand rate white noise random generator.
diwhite returns integers in the continuous range between lo and hi.

- length: Number of values to create
- lo: Minimum value
- hi: Maximum value

As frequency control:

~~~spl syn=A
let a = diwhite(Infinity, 0, [13 15]);
let t = impulse(mouseX(1, 40, 1, 0.2), 0);
let f = demand(t, 0, a) * 30 + 340;
sinOsc(f, 0) * 0.1
~~~

* * *

See also: dwhite, whiteNoise

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Diwhite.html)

Categories: Ugen
