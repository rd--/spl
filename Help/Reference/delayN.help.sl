# delayN

- _delayN(in, maxDelayTime=0.2, delayTime=0.2)_

Delay line, no interpolation.

~~~spl syn=A
let e = impulse(1, 0).perc(0.01, 0.2, 0);
let x = sinOsc(220, 0) * e;
let l = localIn(1, 0) + x;
let y = delayN(l, 0.1, 0.1);
y * 0.1 <! localOut(y * 0.8)
~~~

* * *

See also: delayC

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/delay.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/DelayN.html)

Categories: Ugen
