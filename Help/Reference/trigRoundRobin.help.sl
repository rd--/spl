# trigRoundRobin

- _trigRoundRobin(numChannels=8, in=0)_

Trigger round robin allocator.
Triggers are allocated to output channels from left to right.

- numChannels: integer deciding number of output signals
- in: input signal to be allocated at each trigger

A trigger (_t_) is received four times every second,
the allocator generates five trigger signals (_r_),
each controls a _sinOsc_ (_o_) with distinct
frequency (_f_) and envelope (_e_).

```
let t = impulse(4, 0);
let r = trigRoundRobin(5, t);
let f = tiRand(48, 72, r).midiCps;
let e = decay2(r, 0.05, 2);
let o = sinOsc(f, 0) * e * 0.5;
o.splay
```

* * *

See also: trig, trig1, trigAllocator

Guides: Unit Generators

Categories: Ugen
