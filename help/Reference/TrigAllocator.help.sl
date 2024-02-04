# TrigAllocator

Timed trigger allocator.

_TrigAllocator(numChannels=8, algorithm=1, in=0, dur=0.1)_

Allocate a list of gates defined by trigger and duration signals.
Voices are allocated when a trigger occurs at _in_,
at which time a gate signal is generated that will remain open for _dur_ seconds.
Outputs are allocated left to right, if no output is free a voice-stealing algorithm is implemented.

- numChannels: static integer deciding number of output gate signals
- algorithm: selects voice stealing algorithm, see below
- in: input signal
- dur: when a trigger is recorded this input is sampled and used as the allocated gate duration (in seconds)

Algorithms are:

- 0: no voice stealing
- 1: steal voice with earliest end time
- 2: steal voice with earliest start time

When a voice is stolen, the gate goes to _-1 - in_ for one time step, and then to _in_ at the next step.
This behaviour indicates to _EnvGen_ to immediately release the envelope.

A trigger (_t_) is received four times every second,
a random duration (_d_) is selected for each trigger,
the allocator generates five gate signals (_w_),
each gate controls a _SinOsc_ with distinct
frequency (_f_) and envelope (_e_).

```
let t = Impulse(4, 0);
let d = TRand(0.2, 2, t);
let w = TrigAllocator(5, 1, t, d);
let f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
let e = Asr(w, 0.01, d / 2, -4) * TRand(0.1, 0.2, w);
let o = SinOsc(f, 0) * e;
o.Splay
```

The allocator cycles indexes when not stealing.
In the graph below the gate duration is one millisecond,
so each impulse could be allocated to the same voice,
however it cycles, allowing the decay envelope to sound.

```
let t = Impulse(4, 0);
let w = TrigAllocator(16, 0, t, 0.001);
let e = Decay2(w, 0.01, 4);
let f = TiRand(84, 96, w).MidiCps + TRand(-9, 9, w);
let o = SinOsc(f, 0) * e * 0.1;
o.Splay
```

* * *

See also: Trig, Trig1, TrigRoundRobin
