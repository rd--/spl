# linPan2

- _linPan2(in, pos, level)_

Two channel linear panner.
This one sounds to me more like the Rhodes tremolo than pan2.

- in: input signal
- pos: pan position, -1 is left, +1 is right

Pan noise:

~~~spl syn=A
linPan2(pinkNoise(), fSinOsc(2, 0), 0.1)
~~~

Pan sine:

~~~spl syn=B
linPan2(fSinOsc(800, 0), fSinOsc(3, 0), 0.1)
~~~

* * *

See also: eqPan2, pan2, splay2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LinPan2.html)
