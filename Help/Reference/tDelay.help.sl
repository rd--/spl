# tDelay

- _tDelay(trigger, delayTime)_

Trigger delay.
Delays a trigger by a given time.
Any triggers which arrive in the time between an input trigger and its delayed output, are ignored.

- trigger: input trigger signal.
- delayTime: delay time in seconds.

impulse runs faster than flip flop:

```
let z = impulse(2, 0);
[z, toggleFf(tDelay(z, 0.5)) * sinOsc(440, 0)] * 0.1
```

dust runs faster than flip flop:

```
let z = dust(5);
[z, toggleFf(tDelay(z, 0.5)) * sinOsc(440, 0)] * 0.1
```

* * *

See also: delayC, delay1, delay2

Guides: Unit Generators

Categories: Ugen
