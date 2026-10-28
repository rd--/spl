# out

- _out(bus=0, [c₁ c₂ …])_

Summing output.
Sum a sequence of signals to a bus.

- bus: the index of the bus to sum out to, the lowest numbers correspond to the audio hardware
- channelsList: a list of channels to write out

One `out` summing one `sinOsc` to two buses:

```
let o = sinOsc(440, 0) * 0.1;
out(0, [o o])
```

Two `out` summing distinct frequencies to one bus each:

```
out(
	0,
	sinOsc(440, 0) * 0.1
) <! out(
	1,
	sinOsc(443, 0) * 0.1
)
```

One `out` summing to two buses:

```
out(0, sinOsc([440, 443], 0) * 0.1)
```

* * *

See also: In, audioIn, numOutputBuses

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Out.html)

Categories: Ugen
