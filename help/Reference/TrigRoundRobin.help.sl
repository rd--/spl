# TrigRoundRobin

Trigger round robin allocator.

_TrigRoundRobin(numChannels=8, in=0)_

Triggers are allocated to output channels from left to right.

- numChannels: integer deciding number of output signals
- in: input signal to be allocated at each trigger

A trigger (_t_) is received four times every second,
the allocator generates five trigger signals (_r_),
each controls a _SinOsc_ (_o_) with distinct
frequency (_f_) and envelope (_e_).

```
let t = Impulse(4, 0);
let r = TrigRoundRobin(5, t);
let f = TiRand(48, 72, r).MidiCps;
let e = Decay2(r, 0.05, 2);
let o = SinOsc(f, 0) * e;
o.Splay
```

* * *

See also: Trig, Trig1, TrigAllocator
