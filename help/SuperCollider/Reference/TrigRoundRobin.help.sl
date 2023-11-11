# TrigRoundRobin -- trigger round robin allocator

_TrigRoundRobin(numChannels=8, in=0)_

Triggers are allocated to output channels from left to right.

- numChannels: integer deciding number of output signals
- in: a trigger is recorded when this signal goes from non-positive to positive

A trigger (_t_) is received four times every second,
a random duration (_d_) is selected for each trigger,
the allocator generates five gate signals (_w_),
each gate controls a _SinOsc_ with distinct
frequency (_f_) and envelope (_e_).

```
var t = Impulse(1, 0);
var w = TrigRoundRobin(4, t);
var f = IRand(w, 48, 72).MidiCps;
var e = Decay2(w, 0.05, 2);
var o = SinOsc(f, 0) * e;
o.Splay2
```

* * *

See also: Trig, Trig1, TrigAllocator
