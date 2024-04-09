# GVerb

- _GVerb(in, roomSize, revTime, damping, inputBw, spread, dryLevel, earlyRefLevel, tailLevel, maxRoomSize)_

A two-channel reverb Ugen, based on the _GVerb_ Ladspa effect by Juhana Sadeharju.

- in: mono input.
- roomSize: in squared meters.
- revTime: in seconds.
- damping: high frequency rolloff, 0 damps completely, 1 not at all.
- inputBw: same as damping control, but on the input signal.
- spread: a control on the stereo spread and diffusion of the reverb signal.
- dryLevel: amount of dry signal.
- earlyRefLevel: amount of early reflection level.
- tailLevel: amount of tail level.
- maxRoomSize: to set the size of the delay lines. Defaults to roomsize + 1.

Stereo decayed impulses, reverberated:

```
let i = Impulse([0.5 1 2], 0);
let c = LfCub([300 900 1200], 0);
let s = Decay(i, [0.1 0.05 0.25]) * c * 0.05;
GVerb(s, 10, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).Mix
```

* * *

See also: FreeVerb, FreeVerb2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/GVerb.html)

Categories: UGen, Reverb
