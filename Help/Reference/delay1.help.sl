# delay1

- _delay1(in)_

Single sample delay.

- in: sample to be delayed.

Original, with delayed subtracted from original:

```
let z = dust(1000);
[z, z - delay1(z)]
```

* * *

See also: delayC, delayL, delayN, delayTap, delayWrite, delay2

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/delay1.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Delay1.html)

Categories: Ugen, Delay
