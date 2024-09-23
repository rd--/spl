# DelayN

- _DelayN(in, maxDelayTime=0.2, delayTime=0.2)_

Delay line, no interpolation.

```
let x = Impulse(1, 0).Perc(0.01, 0.2, 0) * SinOsc(220, 0);
let l = LocalIn(1, 0) + x;
let y = DelayN(l, 0.1, 0.1);
y * 0.1 <! LocalOut(y * 0.8)
```

* * *

See also: DelayC

References:
_Csound_
[1](https://csound.com/docs/manual/delay.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/DelayN.html)
