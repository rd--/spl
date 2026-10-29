# trigAllocator

- _trigAllocator(numChannels=8, algorithm=1, in=0, dur=0.1)_

Timed trigger allocator.
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
This behaviour indicates to `envGen` to immediately release the envelope.

A trigger (_t_) is received four times every second,
a random duration (_d_) is selected for each trigger,
the allocator generates five gate signals (_w_),
each gate controls a _sinOsc_ with distinct
frequency (_f_) and envelope (_e_).

~~~spl syn=A
let t = impulse(4, 0);
let d = tRand(0.2, 2, t);
let w = trigAllocator(5, 1, t, d);
let f0 = tiRand(48, 72, w).midiCps;
let f1 = f0 + tRand(-9, 9, w);
let e0 = asr(w, 0.01, d / 2, -4);
let e1 = e0 * tRand(0.1, 0.2, w);
let o = sinOsc(f1, 0) * e1;
o.splay
~~~

The allocator cycles indexes when not stealing.
In the graph below the gate duration is one millisecond,
so each impulse could be allocated to the same voice,
however it cycles, allowing the decay envelope to sound.

~~~spl syn=B
let t = impulse(4, 0);
let w = trigAllocator(16, 0, t, 0.001);
let e = decay2(w * 0.1, 0.01, 4);
let f = tiRand(84, 96, w).midiCps + tRand(-9, 9, w);
let o = sinOsc(f, 0) * e * 0.1;
o.splay / 4
~~~

* * *

See also: TrigRoundRobin, trig, trig1

Guides: Unit Generators

Categories: Ugen
